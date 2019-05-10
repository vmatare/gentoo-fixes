# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SCONS_MIN_VERSION=2.3.0

inherit cmake-utils

DESCRIPTION="C++ Driver for MongoDB"
HOMEPAGE="https://github.com/mongodb/mongo-cxx-driver"
SRC_URI="https://github.com/mongodb/${PN}/archive/r${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug libressl sasl ssl static-libs"

RDEPEND="
	dev-libs/libbson
	>=dev-libs/mongo-c-driver-1.13.0
	dev-libs/boost
	"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-r${PV}"

src_configure() {
	local mycmakeargs=(
		-DBSONCXX_POLY_USE_BOOST=1
	)

	cmake-utils_src_configure
}
