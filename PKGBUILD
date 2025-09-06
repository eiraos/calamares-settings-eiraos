# Maintainer: Fathurrohman <fathurrohmanrosyadi@gmail.com>
pkgname=calamares-settings-eiraos
pkgver=1.0.0
pkgrel=1
pkgdesc='Calamares installer configuration and branding for EiraOS'
arch=(any)
url='https://github.com/eiraos/calamares-settings-eiraos'
license=('GPL')
depends=(calamares)
source=("$url/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7761beee9973338d163f837766e14543d5305e68b2502a404d9301be42598c8e')

package() {
  install -d "${pkgdir}/etc/calamares"
  install -d "${pkgdir}/etc/calamares/modules"
  install -d "${pkgdir}/etc/calamares/qml/calamares"
  install -d "${pkgdir}/etc/calamares/branding/eiraos"

  cp -r branding/eiraos/* "${pkgdir}/etc/calamares/branding/eiraos/"
  cp -r qml/calamares/* "${pkgdir}/etc/calamares/qml/"
  cp -r modules/* "${pkgdir}/etc/calamares/modules/"

  cp settings.conf "${pkgdir}/etc/calamares/settings.conf"
}