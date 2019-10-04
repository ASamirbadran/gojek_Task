//Localized.swift

import Foundation

internal enum L10n {
      /// hello
      internal static var hello: String {
        return L10n.tr("Localizable", "hello")
      }
}

private final class BundleToken {}
