// Dialog component implementation
// Provides modal dialog functionality with proper structure and accessibility

///|
/// Creates a modal dialog overlay that covers the entire screen
pub fn[M] dialog_overlay(
  children : Array[@html.Html[M]],
  open? : Bool = false,
  dismiss? : M? = None,
  class? : String = "",
) -> @html.Html[M] {
  let overlay_style = @theme.get_dialog_overlay_style(class~)
  let backdrop_style = @theme.get_dialog_backdrop_style()
  if open {
    @html.div(class=overlay_style, [
      // Backdrop - clicking it can close the dialog
      @html.div(class=backdrop_style, click?=dismiss, []),
      // Dialog content container
      @html.div(class="relative z-10", children),
    ])
  } else {
    @html.div(class="hidden", [])
  }
}

///|
/// Creates the main dialog content container
pub fn[M] dialog_content(
  children : Array[@html.Html[M]],
  size? : @theme.DialogSize = @theme.Md,
  class? : String = "",
) -> @html.Html[M] {
  let content_style = @theme.get_dialog_content_style(size~, class~)
  let attrs = [
    @html.attribute("class", content_style),
    @html.attribute("role", "dialog"),
    @html.attribute("aria-modal", "true"),
    @html.attribute("aria-labelledby", "dialog-title"),
    @html.attribute("aria-describedby", "dialog-body"),
  ]
  @html.node("div", attrs, children)
}

///|
/// Creates a dialog header with title and optional close button
pub fn[M] dialog_header(
  title : @html.Html[M],
  onClose? : M? = None,
  class? : String = "",
) -> @html.Html[M] {
  let header_style = @theme.get_dialog_header_style(class~)
  let close_button_style = @theme.get_dialog_close_button_style()
  @html.div(class=header_style, [
    // Title with id for aria-labelledby
    @html.div(class="flex-1", [title]),
    // Close button (optional)
    match onClose {
      Some(closeMsg) => {
        let button_attrs = [
          @html.attribute("type", "button"),
          @html.attribute("class", close_button_style),
          @html.attribute("aria-label", "Close dialog"),
          @html.on_click(fn(_) { closeMsg }),
        ]
        @html.node("button", button_attrs, [@html.text("×")])
      }
      None => @html.div([])
    },
  ])
}

///|
/// Form dialog variant with title and form content
pub fn[M] form_dialog(
  title : @html.Html[M],
  content : @html.Html[M],
  submitText? : String = "Submit",
  cancelText? : String = "Cancel",
  onSubmit : M,
  onCancel : M,
  open? : Bool = false,
  submitColor? : @theme.ButtonColor = @theme.Primary,
  size? : @theme.DialogSize = @theme.Md,
  class? : String = "",
) -> @html.Html[M] {
  dialog(
    title=Some(title),
    content,
    footer=Some([
      button(
        [@html.text(cancelText)],
        onCancel,
        variant=@theme.Ghost,
        color=@theme.Secondary,
      ),
      button(
        [@html.text(submitText)],
        onSubmit,
        variant=@theme.Solid,
        color=submitColor,
      ),
    ]),
    size~,
    open~,
    onClose=Some(onCancel),
    onBackdropClick=Some(onCancel),
    class~,
  )
}

///|
/// Alert dialog variant with title, message and single action
pub fn[M] alert_dialog(
  title : @html.Html[M],
  message : @html.Html[M],
  buttonText? : String = "OK",
  onConfirm : M,
  open? : Bool = false,
  buttonColor? : @theme.ButtonColor = @theme.Primary,
  size? : @theme.DialogSize = @theme.Sm,
  class? : String = "",
) -> @html.Html[M] {
  dialog(
    title=Some(title),
    message,
    footer=Some([
      button(
        [@html.text(buttonText)],
        onConfirm,
        variant=@theme.Solid,
        color=buttonColor,
      ),
    ]),
    size~,
    open~,
    onClose=Some(onConfirm),
    onBackdropClick=Some(onConfirm),
    class~,
  )
}

///|
/// Creates a dialog body for main content
pub fn[M] dialog_body(
  children : Array[@html.Html[M]],
  class? : String = "",
) -> @html.Html[M] {
  let body_style = @theme.get_dialog_body_style(class~)
  @html.div(class=body_style, children)
}

///|
/// Creates a dialog footer for action buttons
pub fn[M] dialog_footer(
  children : Array[@html.Html[M]],
  class? : String = "",
) -> @html.Html[M] {
  let footer_style = @theme.get_dialog_footer_style(class~)
  @html.div(class=footer_style, children)
}

///|
/// Complete dialog component that combines all parts
pub fn[M] dialog(
  title? : @html.Html[M]? = None,
  content : @html.Html[M],
  footer? : Array[@html.Html[M]]? = None,
  size? : @theme.DialogSize = @theme.Md,
  open? : Bool = false,
  onClose? : M? = None,
  onBackdropClick? : M? = None,
  class? : String = "",
) -> @html.Html[M] {
  dialog_overlay(
    [
      dialog_content(
        [
          // Header (optional)
          match title {
            Some(titleContent) => dialog_header(titleContent, onClose~)
            None => @html.div([])
          },
          // Body
          dialog_body([content]),
          // Footer (optional)
          match footer {
            Some(footerContent) => dialog_footer(footerContent)
            None => @html.div([])
          },
        ],
        size~,
        class~,
      ),
    ],
    open~,
    dismiss=onBackdropClick,
  )
}

///|
/// Simple dialog variant for basic use cases
pub fn[M] simple_dialog(
  content : @html.Html[M],
  size? : @theme.DialogSize = @theme.Md,
  open? : Bool = false,
  onClose? : M? = None,
  class? : String = "",
) -> @html.Html[M] {
  dialog(content, size~, open~, onClose~, onBackdropClick=onClose, class~)
}

///|
/// Confirmation dialog variant with title and action buttons
pub fn[M] confirm_dialog(
  title : @html.Html[M],
  content : @html.Html[M],
  confirmText? : String = "Confirm",
  cancelText? : String = "Cancel",
  onConfirm : M,
  onCancel : M,
  open? : Bool = false,
  confirmColor? : @theme.ButtonColor = @theme.Primary,
  size? : @theme.DialogSize = @theme.Md,
  class? : String = "",
) -> @html.Html[M] {
  dialog(
    title=Some(title),
    content,
    footer=Some([
      button(
        [@html.text(cancelText)],
        onCancel,
        variant=@theme.Ghost,
        color=@theme.Secondary,
      ),
      button(
        [@html.text(confirmText)],
        onConfirm,
        variant=@theme.Solid,
        color=confirmColor,
      ),
    ]),
    size~,
    open~,
    onClose=Some(onCancel),
    onBackdropClick=Some(onCancel),
    class~,
  )
}
