//
//  SwiftUIViewLoadingPopUp.swift
//  CapStoneProject
//
//  Created by Junne Murdock on 3/13/23.
//

import SwiftUI

struct SwiftUIViewJobDescriptionUploadPopUp: View {
    var body: some View {
        Text("Upload Here")
    }
}

struct TextView: UIViewRepresentable {
    typealias UIViewType = UITextView

    var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.text = text
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}


struct SwiftUIViewLoadingPopUp_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewJobDescriptionUploadPopUp()
    }
}
