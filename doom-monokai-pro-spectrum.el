;;; doom-monokai-pro-spectrum-theme.el --- Monokai Pro's Spectrum flavor -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;; Code:
(defgroup doom-monokai-pro-spectrum-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-monokai-pro-spectrum-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'monokai-pro-spectrum-theme
  :type 'boolean)

(defcustom doom-monokai-pro-spectrum-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'monokai-pro-spectrum-theme
  :type 'boolean)

(defcustom doom-monokai-pro-spectrum-comment-bg doom-monokai-pro-spectrum-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their legibility."
  :group 'monokai-pro-spectrum-theme
  :type 'boolean)

(defcustom doom-monokai-pro-spectrum-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'monokai-pro-spectrum-theme
  :type '(choice integer boolean))

;;
(def-doom-theme monokai-pro-spectrum
  "Monokai Pro's Spectrum flavor by Wimer Hazenberg"

  ;; name        default   256       16
  ((bg         '("#191919" nil       nil            ))
   (bg-alt     '("#222222" nil       nil            ))
   (base0      '("#131313" "#121212" "black"        ))
   (base1      '("#191919" "#1c1c1c" "black"        ))
   (base2      '("#2d2c2d" "#262626" "brightblack"  ))
   (base3      '("#363537" "#3a3a3a" "brightblack"  ))
   (base4      '("#525053" "#585858" "brightblack"  ))
   (base5      '("#585858" "#585858" "brightblack"  ))
   (base6      '("#69676c" "#6c6c6c" "brightblack"  ))
   (base7      '("#8b888f" "#8a8a8a" "brightblack"  ))
   (base8      '("#bab6c0" "#bcbcbc" "white"        ))
   (fg         '("#f7f1ff" "#ffffff" "brightwhite"  ))
   (fg-alt     '("#c6c6c6" "#c6c6c6" "white"        ))

   (grey       base4)
   (red        '("#fc618d" "#ff69bf" "red"          ))
   (orange     '("#fd9353" "#ff7f50" "brightred"    ))
   (green      '("#7bd88f" "#90ee90" "green"        ))
   (yellow     '("#fce566" "#f0e68c" "yellow"       ))
   (violet     '("#948ae3" "#9370db" "magenta"      ))
   (cyan       '("#5ad4e6" "#40e0d0" "brightcyan"   ))

   ;; face categories -- required for all themes
   (highlight      red)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      yellow)
   (builtin        violet)
   (comments       (if doom-monokai-pro-spectrum-brighter-comments cyan base5))
   (doc-comments   (doom-lighten (if doom-monokai-pro-spectrum-brighter-comments cyan base5) 0.25))
   (constants      violet)
   (functions      green)
   (keywords       red)
   (methods        green)
   (operators      red)
   (type           cyan)
   (strings        yellow)
   (variables      (doom-lighten violet 0.4))
   (numbers        violet)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

      ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-monokai-pro-spectrum-brighter-modeline)
   (-modeline-pad
    (when doom-monokai-pro-spectrum-padded-modeline
      (if (integerp doom-monokai-pro-spectrum-padded-modeline) doom-monokai-pro-spectrum-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken cyan 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken cyan 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-monokai-pro-spectrum-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Doom modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   ;; ivy-mode
   (ivy-current-match :background base3 :distant-foreground fg :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground cyan)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ()
  )
(provide 'doom-monokai-pro-spectrum-theme)
;;; doom-monokai-pro-spectrum-theme.el ends here
