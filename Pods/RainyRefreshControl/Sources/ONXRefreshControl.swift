//
//  BaseRefreshControl.swift
//  BaseRefreshControl
//

import UIKit

open class ONXRefreshControl: UIControl {
    
    fileprivate var forbidsOffsetChanges = false
    fileprivate var forbidsInsetChanges = false
    fileprivate var changingInset = false
    fileprivate var refreshing = false
    fileprivate var contentInset: UIEdgeInsets?
    open var animationDuration = TimeInterval(0.33)
    open var animationDamping = CGFloat(0.4)
    open var animationVelocity = CGFloat(0.8)
    //delay for finishing custom animation
    open var delayBeforeEnd = 0.0
    
    fileprivate var expandedHeight: CGFloat {
        return UIScreen.main.bounds.height / 6
    }

    // MARK: Initialization

    public convenience init() {
        self.init(frame: .zero)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    deinit {
        if let superview = superview as? UIScrollView {
            superview.removeObserver(self, forKeyPath: "contentOffset")
        }
    }
    
    // MARK: Superview handling
    
    open override func willMove(toSuperview newSuperview: UIView?) {
        if let superview = superview as? UIScrollView {
            superview.removeObserver(self, forKeyPath: "contentOffset")
        }
        super.willMove(toSuperview: newSuperview)
    }
    
    open override func didMoveToSuperview() {
        if let superview = superview as? UIScrollView {
            superview.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
        }
        super.didMoveToSuperview()
    }

    // MARK: Refresh methods

    open func beginRefreshing() {
        guard let superview = superview as? UIScrollView, !refreshing else { return }
        refreshing = true
        
        //Saving inset
        contentInset = superview.contentInset
        let currentOffset = superview.contentOffset
        
        //Setting new inset
        changingInset = true
        var inset = superview.contentInset
        inset.top = inset.top + expandedHeight
        superview.contentInset = inset
        changingInset = false
        
        //Aaaaand scrolling
        superview.setContentOffset(currentOffset, animated: false)
        superview.setContentOffset(CGPoint(x: 0, y: -inset.top), animated: true)
        forbidsOffsetChanges = true
        didBeginRefresh()
    }
    
    open func endRefreshing() {
        guard let superview = superview as? UIScrollView, refreshing else { return }
        forbidsOffsetChanges = false
        refreshing = false
        self.willEndRefresh()
        DispatchQueue.main.asyncAfter(deadline: .now() + delayBeforeEnd) {
            UIView.animate(withDuration: self.animationDuration,
                           delay: 0,
                           usingSpringWithDamping: self.animationDamping,
                           initialSpringVelocity: self.animationVelocity,
                           options: UIViewAnimationOptions.curveLinear,
                           animations: { () -> Void in
                            if let contentInset = self.contentInset {
                                superview.contentInset = contentInset
                                self.contentInset = nil
                            }
                            
            }) { (finished) -> Void in
                self.didEndRefresh()
            }
        }
    }
    
    // MARK: KVO
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let superview = superview as? UIScrollView, !changingInset else { return }
        //Updating frame
        let topInset = (contentInset ?? superview.contentInset).top
        let originY = superview.contentOffset.y + topInset
        let height = originY
        
        frame = CGRect(origin: CGPoint(x: 0, y: originY),
                       size: CGSize(width: superview.frame.width, height: -height))
        layout()
        //Detecting refresh gesture
        if superview.contentOffset.y + topInset <= -expandedHeight {
            forbidsInsetChanges = true
        } else if !refreshing {
            forbidsInsetChanges = false
        }
        
        if !superview.isDragging && superview.isDecelerating && !forbidsOffsetChanges && forbidsInsetChanges {
            sendActions(for: .valueChanged)
            beginRefreshing()
        }
    }

    open func setup() { }
    open func layout() { }
    open func willBeginRefresh() { }
    open func didBeginRefresh() { }
    open func willEndRefresh() { }
    open func didEndRefresh() { }
}
