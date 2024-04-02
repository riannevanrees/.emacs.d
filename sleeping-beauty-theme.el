(require 'autothemer)

(autothemer-deftheme
   sleeping-beauty "A theme inspired by the Sleeping Beauty movie"

   ((((class color) (min-colors #xFFFFFF))) ;; The theme is for graphical emacs

    ;; Defining the colour palette

    ;; Crowned
    (crowned-dress-dark    "#24257F")
    (crowned-dress-light   "#7880CB")
    (crown                 "#F1AB38")
    (crowned-red           "#7E0204")

    ;; Dragon
    (dragon-purple         "#3B2458")
    (dragon-green          "#85E11B")
    (dragon-yellow         "#E4CF30")
    (dragon-black          "#0D080B")
    (dragon-sky            "#808BB3")

    ;; Once upon a dream
    (dream-black           "#110713")
    (dream-tree            "#E3E7E3")
    (dream-tree-dark       "#D4DCDB")
    (dream-grass           "#B0C577")
    (dream-sky             "#A6C3CB")
    (dream-pink            "#C2ADC4")
    (dream-leaf            "#BBCF5D")

    ;; Fairies
    (merryweather          "#2F58CE")
    (merryweather-light    "#61ADDF")
    (fauna                 "#56930F")
    (fauna-light           "#88AD67")
    (flora                 "#9C181E")
    (flora-brown           "#7E673D")

    ;; Reunited
    (reunited-purple       "#C3A6E9")
    (reunited-dark-purple  "#633979")
    (reunited-yellow       "#F3A040")
    (reunited-red          "#870009")
    (reunited-crown        "#EDC32F")
    (reunited-blue         "#8891D2")
    (reunited-dark-blue    "#6F6FAF")

    ;; Dancing
    (dancing-blue          "#8ED9FC")
    (dancing-red           "#7F0115")

    ;; Sleeping
    (sleeping-sky          "#031D5F")
    (sleeping-sky-green    "#477278")
    (sleeping-crown        "#AF7906")
    (sleeping-fauna        "#72CDC5")
    (sleeping-fauna-dark   "#44A387")
    (sleeping-merryweather "#298ADC")
    (sleeping-flora        "#9D2D53")
    (sleeping-flora-dark   "#841535")
    (sleeping-curtain      "#451760")
    (sleeping-dark-blue    "#2A3FB2")
    (sleeping-light-blue   "#4971B2")
    (sleeping-rose         "#9D0104")
    (sleeping-dress-light  "#ACBFF7")
    (sleeping-dress-dark   "#4556E1")
    (sleeping-bed-green    "#6EBDC2")
    (sleeping-black        "#020D11")
    )

   ;; Customizing the faces
   ((default              (:foreground sleeping-black :background dream-tree :family "JuliaMono" :height 160))
   (variable-pitch        (:family "athelas" :height 1))

   (mode-line-active      (:background dream-sky)) ;dream-sky sleeping-dress-light
   (mode-line-inactive    (:background dream-tree-dark))
   (header-line           (:background sleeping-dress-light))
   (scroll-bar            (:background dream-tree-dark))
   (fringe                (:background dream-tree-dark))
   (cursor                (:background sleeping-black))

   (link                  (:foreground sleeping-fauna-dark :underline t))
   (highlight             (:background sleeping-rose)) ; Doesn't seem to be used at the moment.
   (region                (:foreground "#FFFFFF" :background sleeping-rose))
   (match                 (:foreground sleeping-rose))
   (isearch               ( :foreground "#FFFFFF" :background sleeping-rose))
   (lazy-highlight        (:background sleeping-rose))
   (error                 (:foreground dragon-green
:background dragon-purple :weight 'bold))
   (success               (:foreground dancing-blue :weight 'bold))

   (font-lock-keyword-face   (:foreground merryweather))
   (font-lock-constant-face  (:foreground flora))
   (font-lock-string-face    (:foreground fauna))
   (font-lock-comment-face   (:foreground fauna-light))

   (org-document-title    (:foreground crown :weight 'bold :height 2.0))
   (org-document-info     (:foreground crowned-dress-light))
   (org-level-1           (:foreground crowned-dress-dark :weight 'bold :height 1.5))
   (org-level-2           (:foreground crowned-red :weight 'bold))
   ))

(provide-theme 'sleeping-beauty)
