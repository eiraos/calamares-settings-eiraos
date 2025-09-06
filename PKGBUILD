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
  rm -rf "${pkgdir}/usr/share/calamares"
  
  install -d "${pkgdir}/usr/share/calamares"
  install -d "${pkgdir}/usr/share/calamares/eiraos"
  install -d "${pkgdir}/usr/share/calamares/eiraos/branding"
  install -d "${pkgdir}/usr/share/calamares/eiraos/qml"

  cp -r branding/eiraos/* "${pkgdir}/usr/share/calamares/eiraos/branding/"
  cp -r qml/calamares/* "${pkgdir}/usr/share/calamares/eiraos/qml"

  cp settings.conf "${pkgdir}/usr/share/calamares/"
}