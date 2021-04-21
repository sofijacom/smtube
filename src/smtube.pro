TEMPLATE = app
QT += network

CONFIG += release
#CONFIG += debug

DEFINES += USE_PLAYERS
#DEFINES += D_BUTTON
DEFINES += STYLE_SWITCHING
DEFINES += CODEDOWNLOADER
DEFINES += USE_SITES
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x050F00

# If Qt >= 5.4
greaterThan(QT_MAJOR_VERSION, 4):greaterThan(QT_MINOR_VERSION, 3) {
	DEFINES += HDPI_SUPPORT
}

isEqual(QT_MAJOR_VERSION, 5) {
	QT += webkitwidgets widgets gui
} else {
	QT += webkit
}

HEADERS = links.h \
          mywebview.h \
          mywebpage.h \
          mycookiejar.h \
          retrieveyoutubeurl.h \
          supportedurls.h \
          version.h \
          lineedit_with_icon.h \
          filechooser.h \
          myscroller.h \
          playerdialog.h \
          configdialog.h \
          desktopinfo.h \
          browserwindow.h \
          about.h

SOURCES = mywebview.cpp \
          mywebpage.cpp \
          mycookiejar.cpp \
          retrieveyoutubeurl.cpp \
          supportedurls.cpp \
          version.cpp \
          lineedit_with_icon.cpp \
          filechooser.cpp \
          myscroller.cpp \
          playerdialog.cpp \
          configdialog.cpp \
          desktopinfo.cpp \
          browserwindow.cpp \
          about.cpp \
          main.cpp

FORMS = playerdialog.ui configdialog.ui about.ui

RESOURCES = icons.qrc

contains(DEFINES, USE_PLAYERS) {
	HEADERS += players.h
	SOURCES += players.cpp
} else {
	HEADERS += hcplayer.h
}

contains(DEFINES, USE_SITES) {
	HEADERS += sites.h sitedialog.h
	SOURCES += sites.cpp sitedialog.cpp
	FORMS += sitedialog.ui
}

contains( DEFINES, HDPI_SUPPORT ) {
	HEADERS += hdpisupport.h
	SOURCES += hdpisupport.cpp
}

contains( DEFINES, CODEDOWNLOADER ) {
	HEADERS += codedownloader.h
	SOURCES += codedownloader.cpp
}

unix {
	UI_DIR = .ui
	MOC_DIR = .moc
	OBJECTS_DIR = .obj
	DEFINES += TRANSLATION_PATH=$(TRANSLATION_PATH)
}

win32 {
	RC_FILE = smtube.rc
	CONFIG(debug, debug|release) {
		CONFIG += console
	}
}

TRANSLATIONS = translations/smtube_es.ts \
               translations/smtube_es_ES.ts \
               translations/smtube_en.ts \
               translations/smtube_de.ts \
               translations/smtube_fr.ts \
               translations/smtube_it.ts \
               translations/smtube_ko.ts \
               translations/smtube_pt.ts \
               translations/smtube_sr.ts \
               translations/smtube_eu.ts \
               translations/smtube_gl.ts \
               translations/smtube_ja.ts \
               translations/smtube_pt_BR.ts \
               translations/smtube_ru.ts \
               translations/smtube_zh_TW.ts \
               translations/smtube_cs.ts \
               translations/smtube_pl.ts \
               translations/smtube_nn_NO.ts \
               translations/smtube_hr.ts \
               translations/smtube_bg.ts \
               translations/smtube_da.ts \
               translations/smtube_en_GB.ts \
               translations/smtube_ms.ts \
               translations/smtube_zh_CN.ts \
               translations/smtube_uk.ts \
               translations/smtube_sq.ts \
               translations/smtube_tr.ts \
               translations/smtube_hu.ts \
               translations/smtube_he_IL.ts \
               translations/smtube_el.ts \
               translations/smtube_nb_NO.ts \
               translations/smtube_ca.ts

