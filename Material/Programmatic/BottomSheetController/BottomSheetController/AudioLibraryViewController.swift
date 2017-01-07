/*
 * Copyright (C) 2015 - 2017, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.com>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *	*	Redistributions of source code must retain the above copyright notice, this
 *		list of conditions and the following disclaimer.
 *
 *	*	Redistributions in binary form must reproduce the above copyright notice,
 *		this list of conditions and the following disclaimer in the documentation
 *		and/or other materials provided with the distribution.
 *
 *	*	Neither the name of CosmicMind nor the names of its
 *		contributors may be used to endorse or promote products derived from
 *		this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit
import Material

class AudioLibraryViewController: UIViewController {
    fileprivate var fabButton: FABButton!
    
    fileprivate var collectionViewCard: CollectionViewCard!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        
        prepareCollectionViewCard()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewCard.width = view.bounds.width
        collectionViewCard.contentView?.height = view.bounds.height
        print(collectionViewCard)
    }
}

extension AudioLibraryViewController {
    fileprivate func prepareFABButton() {
        fabButton = FABButton()
        fabButton.addTarget(self, action: #selector(handleFABButton(button:)), for: .touchUpInside)
        view.layout(fabButton).width(64).height(64).bottom(24).right(24)
    }
    
    fileprivate func prepareCollectionViewCard() {
        collectionViewCard = CollectionViewCard()
        collectionViewCard.backgroundColor = Color.green.base
        
        let backButton = IconButton(image: Icon.cm.arrowBack, tintColor: .white)
        backButton.pulseColor = .white
        
        toolbarController?.toolbar.leftViews = [backButton]
        
        collectionViewCard.contentView = UIView()
        
        
        view.addSubview(collectionViewCard)
        print(collectionViewCard)
    }
}

extension AudioLibraryViewController {
    @objc
    fileprivate func handleFABButton(button: UIButton) {
        bottomSheetController?.openBottomSheet()
    }
}