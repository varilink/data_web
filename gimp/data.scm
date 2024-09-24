; ------------------------------------------------------------------------------
; gimp/data.scm
; ------------------------------------------------------------------------------

; Gimp batch script used to generate several images from source files.

;; DATA logo files provided by Tom
(define logoWithNameImage (car (gimp-file-load RUN-NONINTERACTIVE
      "src/logo(with name).jpg" "src/logo(with name).jpg"
)))
(define logoWithoutNameImage (car (gimp-file-load RUN-NONINTERACTIVE
      "src/logo(without name).jpg" "src/logo(without name).jpg"
)))
;; Diary, masks, seats and tickets images sourced via the Varilink Computing
;; Ltd Shutterstock account
(define diaryImage (car (gimp-file-load RUN-NONINTERACTIVE
  "src/shutterstock_308941397.eps" "src/shutterstock_308941397.eps"
)))
(define masksImage (car (gimp-file-load RUN-NONINTERACTIVE
  "src/shutterstock_163896773.eps" "src/shutterstock_163896773.eps"
)))
(define seatsImage (car (gimp-file-load RUN-NONINTERACTIVE
  "src/shutterstock_317742068.jpg" "src/shutterstock_317742068.jpg"
)))
(define ticketsImage (car (gimp-file-load RUN-NONINTERACTIVE
  "src/shutterstock_97049318.eps" "src/shutterstock_97049318.eps"
)))

;; logo image used in the footer of DATA website pages
(let*
  
  (
    (footerLogoImage (car (gimp-image-duplicate logoWithoutNameImage)))
    (footerLogoDrawable (car (gimp-image-get-active-layer footerLogoImage)))
  )

  (gimp-image-scale footerLogoImage 175 175)
  (gimp-image-crop footerLogoImage 175 125 0 25)

  (file-webp-save
    RUN-NONINTERACTIVE   ; Interactive, non-interactive
    footerLogoImage      ; Input image
    footerLogoDrawable   ; Drawable to save
    "/website/logo.webp" ; The name of the file to save the image to
    "/website/logo.webp" ; The name entered
    0                    ; preset
    0                    ; Use lossless encoding
    90                   ; Quality of the image
    100                  ; Quality of the image's alpha channel
    0                    ; Use layers for animation
    0                    ; Loop animation infinitely
    0                    ; Minimize animation size
    0                    ; Maximum distance between key-frames
    1                    ; Toggle saving exif data
    1                    ; Toggle saving iptc data
    1                    ; Toggle saving xmp data
    0                    ; Delay
    0                    ; Force delay on all frames
  )

  (gimp-image-delete footerLogoImage)

)

;; logo used in PDF one page flyer

(let*
  
  (
    (footerLogoImage (car (gimp-image-duplicate logoWithoutNameImage)))
    (footerLogoDrawable (car (gimp-image-get-active-layer footerLogoImage)))
  )

  (gimp-image-scale footerLogoImage 125 125)
  (gimp-image-crop footerLogoImage 125 90 0 15)

  (file-jpeg-save
    RUN-NONINTERACTIVE  ; Interactive, non-interactive
    footerLogoImage     ; Input image
    footerLogoDrawable  ; Drawable to save
    "/website/logo.jpg" ; The name of the file to save the image to
    "/website/logo.jpg" ; The name entered
    0.90                ; quality
    0                   ; smoothing
    TRUE                ; optimize
    TRUE                ; progressive
    ""                  ; comment
    2                   ; subsmp (best quality)
    FALSE               ; baseline
    FALSE               ; restart
    0                   ; dct (integer method)
  )

  (gimp-image-delete footerLogoImage)

)

;; logo used in DATA Twitter profile
(let*

  (
    (twitterLogoImage (car (gimp-image-duplicate logoWithoutNameImage)))
    (twitterLogoDrawable (car (gimp-image-get-active-layer twitterLogoImage)))
  )

  (gimp-image-scale twitterLogoImage 400 400)

  (file-jpeg-save
    RUN-NONINTERACTIVE         ; run-mode
    twitterLogoImage           ; Input image
    twitterLogoDrawable        ; Drawable to save
    "/other/twitter-logo.jpeg" ; filename
    "/other/twitter-logo.jpeg" ; raw-filename
    0.90                       ; quality
    0                          ; smoothing
    TRUE                       ; optimize
    TRUE                       ; progressive
    ""                         ; comment
    2                          ; subsmp (best quality)
    FALSE                      ; baseline
    FALSE                      ; restart
    0                          ; dct (integer method)
  )

  (gimp-image-delete twitterLogoImage)

)

;; logo use in DATA Facebook page profile
(let*

  (
    (facebookLogoImage (car (gimp-image-duplicate logoWithNameImage)))
    (facebookLogoDrawable (car (gimp-image-get-active-layer facebookLogoImage)))
  )

  (file-jpeg-save
    RUN-NONINTERACTIVE          ; run-mode
    facebookLogoImage           ; Input image
    facebookLogoDrawable        ; Drawable to save
    "/other/facebook-logo.jpeg" ; filename
    "/other/facebook-logo.jpeg" ; raw-filename
    0.90                        ; quality
    0                           ; smoothing
    TRUE                        ; optimize
    TRUE                        ; progressive
    ""                          ; comment
    2                           ; subsmp (best quality)
    FALSE                       ; baseline
    FALSE                       ; restart
    0                           ; dct (integer method)
  )

  (gimp-image-delete facebookLogoImage)

)

;; events listing header image for the website
(let*

  (
    (eventsListingImage (car (gimp-image-duplicate ticketsImage)))
    (eventsListingDrawable (car (
      gimp-image-get-active-layer eventsListingImage
    )))
  )

  (gimp-image-scale eventsListingImage 184 184)

  (gimp-image-crop eventsListingImage
    184 125 0 30 ; width, height, offset x, offset y
  )

  (gimp-context-set-sample-threshold-int 15)

  (gimp-drawable-edit-bucket-fill
    eventsListingDrawable ; drawable
    FILL-WHITE            ; fill-type
    10                    ; x (seed)
    10                    ; y (seed)
  )

  (file-webp-save
    RUN-NONINTERACTIVE             ; Interactive, non-interactive
    eventsListingImage             ; Input image
    eventsListingDrawable          ; Drawable to save
    "/website/events-listing.webp" ; The name of the file to save the image to
    "/website/events-listing.webp" ; The name entered
    0                              ; preset
    0                              ; Use lossless encoding
    90                             ; Quality of the image
    100                            ; Quality of the image's alpha channel
    0                              ; Use layers for animation
    0                              ; Loop animation infinitely
    0                              ; Minimize animation size
    0                              ; Maximum distance between key-frames
    1                              ; Toggle saving exif data
    1                              ; Toggle saving iptc data
    1                              ; Toggle saving xmp data
    0                              ; Delay
    0                              ; Force delay on all frames
  )

  (gimp-image-delete eventsListingImage)

)

;; member societies header image for the website
(let*

  (
    (memberSocietiesImage (car (gimp-image-duplicate masksImage)))
    (memberSocietiesDrawable (car (
      gimp-image-get-active-layer memberSocietiesImage
    )))
  )

  (gimp-image-resize memberSocietiesImage
    600 500 45 10 ; width, height, offset x, offset y
  )
  (gimp-layer-resize-to-image-size memberSocietiesDrawable)

  (gimp-image-scale memberSocietiesImage 184 153)

  (gimp-image-crop memberSocietiesImage
    184 125 0 0 ; width, height, offset x, offset y
  )

  (file-webp-save
    RUN-NONINTERACTIVE               ; Interactive, non-interactive
    memberSocietiesImage             ; Input image
    memberSocietiesDrawable          ; Drawable to save
    "/website/member-societies.webp" ; The name of the file to save the image to
    "/website/member-societies.webp" ; The name entered
    0                                ; preset
    0                                ; Use lossless encoding
    90                               ; Quality of the image
    100                              ; Quality of the image's alpha channel
    0                                ; Use layers for animation
    0                                ; Loop animation infinitely
    0                                ; Minimize animation size
    0                                ; Maximum distance between key-frames
    1                                ; Toggle saving exif data
    1                                ; Toggle saving iptc data
    1                                ; Toggle saving xmp data
    0                                ; Delay
    0                                ; Force delay on all frames
  )

  (gimp-image-delete memberSocietiesImage)

)

;; diary scheme header image for the website
(let*

  (
    (diarySchemeImage (car (gimp-image-duplicate diaryImage)))
    (diarySchemeDrawable (car (gimp-image-get-active-layer diarySchemeImage)))
  )

  (gimp-image-scale diarySchemeImage 215 215)
  (gimp-image-crop diarySchemeImage
    215 125 0 45 ; width, height, offset x, offset y
  )

  (file-webp-save
    RUN-NONINTERACTIVE               ; Interactive, non-interactive
    diarySchemeImage                 ; Input image
    diarySchemeDrawable              ; Drawable to save
    "/website/the-diary-scheme.webp" ; The name of the file to save the image to
    "/website/the-diary-scheme.webp" ; The name entered
    0                                ; preset
    0                                ; Use lossless encoding
    90                               ; Quality of the image
    100                              ; Quality of the image's alpha channel
    0                                ; Use layers for animation
    0                                ; Loop animation infinitely
    0                                ; Minimize animation size
    0                                ; Maximum distance between key-frames
    1                                ; Toggle saving exif data
    1                                ; Toggle saving iptc data
    1                                ; Toggle saving xmp data
    0                                ; Delay
    0                                ; Force delay on all frames
  )

  (gimp-image-delete diarySchemeImage)

)

(gimp-image-delete logoWithNameImage)

;; hero image for the website
(let*

  (
    (heroImage (car (gimp-image-duplicate seatsImage)))
    (heroDrawable (car (gimp-image-get-active-layer heroImage)))
  )

  (gimp-image-scale heroImage 1200 800)

  (file-jpeg-save
    RUN-NONINTERACTIVE  ; run-mode
    heroImage           ; Input image
    heroDrawable        ; Drawable to save
    "/website/hero.jpg" ; filename
    "/website/hero.jpg" ; raw-filename
    0.90                ; quality
    0                   ; smoothing
    TRUE                ; optimize
    TRUE                ; progressive
    ""                  ; comment
    2                   ; subsmp (best quality)
    FALSE               ; baseline
    FALSE               ; restart
    0                   ; dct (integer method)
  )

  (gimp-image-delete heroImage)

)

;; email header image
(let*

  (
    (emailHeaderImage (car (gimp-image-duplicate seatsImage)))
    (emailHeaderDrawable (car (gimp-image-get-active-layer emailHeaderImage)))
  )

  (gimp-image-scale emailHeaderImage 375 250)
  (gimp-image-crop emailHeaderImage
    250 250 0 0 ; width, height, offset x, offset y
  )

  (file-jpeg-save
    RUN-NONINTERACTIVE  ; run-mode
    emailHeaderImage    ; Input image
    emailHeaderDrawable ; Drawable to save
    "/website/data.jpg" ; filename
    "/website/data.jpg" ; raw-filename
    0.90                ; quality
    0                   ; smoothing
    TRUE                ; optimize
    TRUE                ; progressive
    ""                  ; comment
    2                   ; subsmp (best quality)
    FALSE               ; baseline
    FALSE               ; restart
    0                   ; dct (integer method)
  )

  (gimp-image-delete emailHeaderImage)

)

;; banner image for Twitter
(let*

  (
    (twitterBannerImage (car (gimp-image-duplicate seatsImage)))
    (twitterBannerDrawable (car (
      gimp-image-get-active-layer twitterBannerImage
    )))
  )

  (gimp-image-scale twitterBannerImage 600 400)
  (gimp-image-crop twitterBannerImage
    600 200 0 100 ; width, height, offset x, offset y
  )

  (file-jpeg-save
    RUN-NONINTERACTIVE           ; run-mode
    twitterBannerImage           ; Input image
    twitterBannerDrawable        ; Drawable to save
    "/other/twitter-banner.jpeg" ; filename
    "/other/twitter-banner.jpeg" ; raw-filename
    0.90                         ; quality
    0                            ; smoothing
    TRUE                         ; optimize
    TRUE                         ; progressive
    ""                           ; comment
    2                            ; subsmp (best quality)
    FALSE                        ; baseline
    FALSE                        ; restart
    0                            ; dct (integer method)
  )

  (gimp-image-delete twitterBannerImage)

)

(gimp-image-delete logoWithoutNameImage)
(gimp-image-delete diaryImage)
(gimp-image-delete masksImage)
(gimp-image-delete seatsImage)
(gimp-image-delete ticketsImage)
(gimp-quit 0)
