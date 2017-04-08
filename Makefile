THEMENAME = ravensys
THEMEDESC = RavenSys theme for GRUB2
VERSION = $(shell date '+%Y%m%d')

WIDTH = 1920
HEIGHT = 1080

LOGOWIDTH = 600
LOGOHEIGHT = 190
LOGOALPHA = 70

ICONS += centos
ICONS += clonezilla
ICONS += debian
ICONS += fedora
ICONS += gnu-linux
ICONS += kali
ICONS += power
ICONS += systemrescuecd
ICONS += tails
ICONS += utilities
ICONS += windows

theme-dir = /boot/grub2/themes/$(THEMENAME)
theme-file = theme.txt

background-file = background.png

boot-menu-filename = menu
boot-menu-files = $(addprefix $(boot-menu-filename)_,$(addsuffix .png,w))
boot-menu-border-color = \#ffffff4c
boot-menu-border-width = 1
boot-menu-margin = 3
boot-menu-padding = 26
boot-menu-res-width = $$(( $(boot-menu-margin) + $(boot-menu-border-width) + $(boot-menu-padding) ))

boot-menu-font-filename = $(boot-menu-font-name)-$(boot-menu-font-weight)-$(boot-menu-font-size)
boot-menu-font-name = DejaVu-Sans
boot-menu-font-size = 14
boot-menu-font-weight = Bold

font-files = $(addsuffix .pf2,$(boot-menu-font-filename) $(label-font-filename) $(terminal-font-filename))

icon-dir = icons
icon-files = $(addprefix $(icon-dir)/,$(addsuffix .png,$(ICONS)))

label-font-filename = $(label-font-name)-$(label-font-weight)-$(label-font-size)
label-font-name = DejaVu-Sans
label-font-size = 14
label-font-weight = Regular

logo-file = logo.png

progress-filename = progress
progress-files = $(addprefix $(progress-filename)_,$(addsuffix .png,bar_c highlight_c))
progress-background-color = \#ffffff26
progress-highlight-color = \#ffffff4c
progress-height = 25
progress-bar-height = 5

scrollbar-filename = scrollbar
scrollbar-files = $(addprefix $(scrollbar-filename)_,$(addsuffix .png,c n s))
scrollbar-color = \#524540
scrollbar-margin-left = 5
scrollbar-margin-right = 5
scrollbar-padding-bottom = 10
scrollbar-padding-top = 10
scrollbar-width = 10
scrollbar-res-width = $$(( $(scrollbar-width) + $(scrollbar-margin-left) + $(scrollbar-margin-right) ))

select-filename = select
select-files = $(addprefix $(select-filename)_,$(addsuffix .png,c e w))
select-background-color = \#ffffff4c
select-padding-left = 8
select-padding-right = 4

select-font-filename = $(select-font-name)-$(select-font-weight)-$(select-font-size)
select-font-name = DejaVu-Sans
select-font-size = 14
select-font-weight = Bold

terminal-box-filename = terminal_box
terminal-box-files = $(addprefix $(terminal-box-filename)_,$(addsuffix .png,c e n ne nw s se sw w))
terminal-box-backgroud-color = \#000000ee
terminal-box-border-color = \#000000
terminal-box-border-width = 1
terminal-box-margin = 1
terminal-box-padding = 3
terminal-box-res-height = $$(( $(terminal-box-padding) + $(terminal-box-border-width) + $(terminal-box-margin) ))
terminal-box-res-width = $$(( $(terminal-box-padding) + $(terminal-box-border-width) + $(terminal-box-margin) ))

terminal-box-obj-edge = $(OBJDIR)/$(terminal-box-filename)-edge.bmp
terminal-box-obj-corner = $(OBJDIR)/$(terminal-box-filename)-corner.bmp

terminal-font-filename = $(terminal-font-name)-$(terminal-font-weight)-$(terminal-font-size)
terminal-font-name = Unifont
terminal-font-size = 15
terminal-font-weight = Regular

dist-filename = grub2-theme-$(THEMENAME)
dist-files += $(addprefix $(srcdir)/, $(source-files))
dist-files += Attribution
dist-files += CC-BY-SA-4.0
dist-files += LICENSE
dist-files += Makefile
#TODO create README file
#dist-files += README.md
dist-archive = $(dist-filename).tar.gz $(dist-filename).tar.xz

release-filename = grub2-theme-$(THEMENAME)-$(VERSION)
release-files += $(background-file)
release-files += $(boot-menu-files)
release-files += $(font-files)
release-files += $(icon-files)
release-files += $(logo-file)
release-files += $(progress-files)
release-files += $(scrollbar-files)
release-files += $(select-files)
release-files += $(terminal-box-files)
release-files += $(theme-file)
release-files += Attribution
release-files += CC-BY-SA-4.0
release-archive = $(release-filename).tar.gz $(release-filename).tar.xz

srcdir = src

source-files += logo.svgz
source-files += texture.png
source-files += theme.txt.in
source-files += font/$(boot-menu-font-name)-$(boot-menu-font-weight).ttf
source-files += font/$(label-font-name)-$(label-font-weight).ttf
source-files += font/$(select-font-name)-$(select-font-weight).ttf
source-files += font/$(terminal-font-name)-$(terminal-font-weight).ttf
source-files += $(addprefix icon/,$(addsuffix .png,$(ICONS)))

OBJDIR = obj
VPATH = $(srcdir)

.PHONY: all
all: $(background-file) $(boot-menu-filename) $(font-files) $(icon-files) $(logo-file) $(progress-filename) $(scrollbar-filename) $(select-filename) $(terminal-box-filename) $(theme-file)

.PHONY: install
install:
	install -d -m 0755 $(DESTDIR)$(theme-dir)
	install -m 0644 $(background-file) $(DESTDIR)$(theme-dir)
	install -m 0644 $(boot-menu-files) $(DESTDIR)$(theme-dir)
	install -m 0644 $(font-files) $(DESTDIR)$(theme-dir)
	install -d -m 0755 $(DESTDIR)$(theme-dir)/$(icon-dir)
	install -m 0644 $(icon-files) $(DESTDIR)$(theme-dir)/$(icon-dir)
	install -m 0644 $(logo-file) $(DESTDIR)$(theme-dir)
	install -m 0644 $(progress-files) $(DESTDIR)$(theme-dir)
	install -m 0644 $(scrollbar-files) $(DESTDIR)$(theme-dir)
	install -m 0644 $(select-files) $(DESTDIR)$(theme-dir)
	install -m 0644 $(terminal-box-files) $(DESTDIR)$(theme-dir)
	install -m 0644 $(theme-file) $(DESTDIR)$(theme-dir)

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(theme-dir)/$(background-file)
	rm -f $(addprefix $(DESTDIR)$(theme-dir)/,$(boot-menu-files))
	rm -f $(addprefix $(DESTDIR)$(theme-dir)/,$(font-files))
	rm -f $(addprefix $(DESTDIR)$(theme-dir)/$(icon-dir)/,$(icon-files))
	rm -rf $(DESTDIR)$(theme-dir)/$(icon-dir)
	rm -f $(DESTDIR)$(theme-dir)/$(logo-file)
	rm -f $(addprefix $(DESTDIR)$(theme-dir)/,$(progress-files))
	rm -f $(addprefix $(DESTDIR)$(theme-dir)/,$(scrollbar-files))
	rm -f $(addprefix $(DESTDIR)$(theme-dir)/,$(select-files))
	rm -f $(addprefix $(DESTDIR)$(theme-dir)/,$(terminal-box-files))
	rm -f $(DESTDIR)$(theme-dir)/$(theme-file)
	rm -rf $(DESTDIR)$(theme-dir)

.PHONY: clean
clean:
	rm -rf $(OBJDIR)
	rm -f $(background-file)
	rm -f $(boot-menu-files)
	rm -f $(font-files)
	rm -f $(icon-files)
	rm -rf $(icon-dir)
	rm -f $(logo-file)
	rm -f $(progress-files)
	rm -f $(scrollbar-files)
	rm -f $(select-files)
	rm -f $(terminal-box-files)
	rm -f $(theme-file)
	
.PHONY: cleanall
cleanall: clean
	rm -f $(dist-archive)
	rm -f $(release-archive)

.PHONY: dist
dist: $(dist-archive)

.PHONY: release
release: $(release-archive)

$(theme-file): theme.txt.in
	sed \
		-e "s/@BACKGROUND_IMAGE@/$(background-file)/" \
		-e "s/@BOOT_MENU_FONT@/$(boot-menu-font-name) $(boot-menu-font-weight) $(boot-menu-font-size)/" \
		-e "s/@BOOT_MENU_PREFIX@/$(boot-menu-filename)/" \
		-e "s/@LABEL_FONT@/$(label-font-name) $(label-font-weight) $(label-font-size)/" \
		-e "s/@LOGO_IMAGE@/$(logo-file)/" \
		-e "s/@PROGRESS_BAR_PREFIX@/$(progress-filename)_bar/" \
		-e "s/@PROGRESS_HIGHLIGHT_PREFIX@/$(progress-filename)_highlight/" \
		-e "s/@SELECT_FONT@/$(select-font-name) $(select-font-weight) $(select-font-size)/" \
		-e "s/@SELECT_PREFIX@/$(select-filename)/" \
		-e "s/@TERMINAL_BOX_PREFIX@/$(terminal-box-filename)/" \
		-e "s/@TERMINAL_FONT@/$(terminal-font-name) $(terminal-font-weight) $(terminal-font-size)/" \
		"$<" > "$@"

$(background-file): texture.png
	convert "$<" -gravity center -crop "$(WIDTH)x$(HEIGHT)+0+0" png32:"$@"

.PHONY: $(boot-menu-filename)
$(boot-menu-filename): $(boot-menu-files)

$(boot-menu-filename)_w.png:
	convert -size "$(boot-menu-res-width)x1" canvas:none \
		-fill "$(boot-menu-border-color)" \
			-draw "line $(boot-menu-margin),0 $$(( $(boot-menu-margin) + $(boot-menu-border-width) - 1 )),0" \
		png32:"$@"

$(boot-menu-font-filename).pf2: font/$(boot-menu-font-name)-$(boot-menu-font-weight).ttf
	grub2-mkfont -n "$(boot-menu-font-name)" -s $(boot-menu-font-size) -o "$@" "$<"

$(icon-dir):
	mkdir -p "$@"

$(icon-files): $(icon-dir)/%: icon/% | $(icon-dir)
	cp "$<" "$@"

$(label-font-filename).pf2: font/$(label-font-name)-$(label-font-weight).ttf
	grub2-mkfont -n "$(label-font-name)" -s $(label-font-size) -o "$@" "$<"

$(logo-file): logo.svgz
	inkscape -z -e "$@" -w "$(LOGOWIDTH)" -h "$(LOGOHEIGHT)" "$<"
	convert "$@" -alpha on -channel a -evaluate subtract "$(LOGOALPHA)%" png32:"$@"

.PHONY: $(progress-filename)
$(progress-filename): $(progress-files)

$(progress-filename)_bar_c.png:
	convert -size "1x$(progress-height)" canvas:none \
		-fill "$(progress-background-color)" \
			-draw "rectangle 0,0 $$(( $(progress-height) - 1 )),$$(( $(progress-bar-height) - 1 ))" \
		png32:"$@"

$(progress-filename)_highlight_c.png:
	convert -size "1x$(progress-height)" canvas:none \
		-fill "$(progress-highlight-color)" \
			-draw "rectangle 0,0 $$(( $(progress-height) - 1 )),$$(( $(progress-bar-height) - 1 ))" \
		png32:"$@"

.PHONY: $(scrollbar-filename)
$(scrollbar-filename): $(scrollbar-files)

$(scrollbar-filename)_c.png:
	convert -size "$(scrollbar-res-width)x1" canvas:none \
		-fill "$(scrollbar-color)" \
			-draw "line $(scrollbar-margin-left),0 $$(( $(scrollbar-margin-left) + $(scrollbar-width) - 1 )),0" \
		png32:"$@"

$(scrollbar-filename)_n.png:
	convert -size "$(scrollbar-res-width)x$(scrollbar-padding-top)" canvas:none \
		-fill "$(scrollbar-color)" \
			-draw "rectangle $(scrollbar-margin-left),0 $$(( $(scrollbar-width) + $(scrollbar-margin-left) - 1 )),$$(( $(scrollbar-padding-top) - 1 ))" \
		png32:"$@"

$(scrollbar-filename)_s.png:
	convert -size "$(scrollbar-res-width)x$(scrollbar-padding-bottom)" canvas:none \
		-fill "$(scrollbar-color)" \
			-draw "rectangle $(scrollbar-margin-left),0 $$(( $(scrollbar-width) + $(scrollbar-margin-left) - 1 )),$$(( $(scrollbar-padding-bottom) - 1 ))" \
		png32:"$@"

.PHONY: $(select-filename)
$(select-filename): $(select-files)

$(select-filename)_c.png:
	convert -size "1x1" canvas:"$(select-background-color)" png32:"$@"

$(select-filename)_e.png:
	convert -size "$(select-padding-right)x1" canvas:"$(select-background-color)" png32:"$@"

$(select-filename)_w.png:
	convert -size "$(select-padding-left)x1" canvas:"$(select-background-color)" png32:"$@"

$(select-font-filename).pf2: font/$(select-font-name)-$(select-font-weight).ttf
	grub2-mkfont -n "$(select-font-name)" -s $(select-font-size) -o "$@" "$<"

.PHONY: $(terminal-box-filename)
$(terminal-box-filename): $(terminal-box-files)

$(terminal-box-filename)_c.png:
	convert -size "1x1" canvas:none \
		-fill "$(terminal-box-backgroud-color)" \
			-draw "point 0,0" \
		png32:"$@"

$(terminal-box-filename)_e.png: $(terminal-box-obj-edge)
	convert "$<" png32:"$@"

$(terminal-box-filename)_n.png: $(terminal-box-obj-edge)
	convert "$<" -rotate 270 png32:"$@"

$(terminal-box-filename)_s.png: $(terminal-box-obj-edge)
	convert "$<" -rotate 90 png32:"$@"

$(terminal-box-filename)_w.png: $(terminal-box-obj-edge)
	convert "$<" -rotate 180 png32:"$@"

$(terminal-box-filename)_ne.png: $(terminal-box-obj-corner)
	convert "$<" -rotate 270 png32:"$@"

$(terminal-box-filename)_nw.png: $(terminal-box-obj-corner)
	convert "$<" -rotate 180 png32:"$@"

$(terminal-box-filename)_se.png: $(terminal-box-obj-corner)
	convert "$<" png32:"$@"

$(terminal-box-filename)_sw.png: $(terminal-box-obj-corner)
	convert "$<" -rotate 90 png32:"$@"

$(terminal-box-obj-edge): | $(OBJDIR)
	convert -size "$(terminal-box-res-width)x1" canvas:none \
		-fill "$(terminal-box-backgroud-color)" \
			-draw "line 0,0 $$(( $(terminal-box-padding) - 1 )),0" \
		png32:"$@"
ifneq ($(terminal-box-border-width), 0)
	convert "$@" \
		-fill "$(terminal-box-border-color)" \
			-draw "line $(terminal-box-padding),0 $$(( $(terminal-box-padding) + $(terminal-box-border-width) - 1 )),0" \
		png32:"$@"
endif

$(terminal-box-obj-corner): | $(OBJDIR)
	convert -size "$(terminal-box-res-width)x$(terminal-box-res-height)" canvas:none \
		-fill "$(terminal-box-backgroud-color)" \
			-draw "rectangle 0,0 $$(( $(terminal-box-padding) - 1 )),$$(( $(terminal-box-padding) - 1 ))" \
		png32:"$@"
ifneq ($(terminal-box-border-width), 0)
	convert "$@" \
		-fill "$(terminal-box-border-color)" \
			-draw "rectangle $(terminal-box-padding),0 $$(( $(terminal-box-padding) + $(terminal-box-border-width) -1 )),$$(( $(terminal-box-padding) - 1 ))" \
			-draw "rectangle 0,$(terminal-box-padding) $$(( $(terminal-box-padding) + $(terminal-box-border-width) -1 )),$$(( $(terminal-box-padding) + $(terminal-box-border-width) -1 ))" \
		png32:"$@"
endif

$(terminal-font-filename).pf2: font/$(terminal-font-name)-$(terminal-font-weight).ttf
	grub2-mkfont -n "$(terminal-font-name)" -s $(terminal-font-size) -o "$@" "$<"

$(OBJDIR):
	mkdir -p "$@"

$(dist-filename).tar.gz: $(dist-files)
	tar -czf "$@" --transform "s/^\./$(dist-filename)/" $(addprefix ./,$^)

$(dist-filename).tar.xz: $(dist-files)
	tar -cJf "$@" --transform "s/^\./$(dist-filename)/" $(addprefix ./,$^)

$(release-filename).tar.gz: $(release-files)
	tar -czf "$@" --transform "s/^\./$(release-filename)/" $(addprefix ./,$^)

$(release-filename).tar.xz: $(release-files)
	tar -cJf "$@" --transform "s/^\./$(release-filename)/" $(addprefix ./,$^)

