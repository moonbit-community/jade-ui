// Dialog component implementation
// Provides modal dialog functionality with proper structure and accessibility

///|
/// Creates a modal dialog overlay that covers the entire screen
pub fn[M] dialog_overlay(
  id~ : String,
  children : Array[@html.Html[M]],
  close~ : M,
  class? : String = "",
) -> @html.Html[M] {
  let overlay_style = @theme.get_dialog_overlay_style(class~)
  @html.dialog(id~, class=overlay_style, close=_ => close, cancel=close, [
    @html.div(class="relative z-10", children),
  ])
}

///|
/// Creates the main dialog content container
pub fn[M] dialog_box(
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
  close~ : M,
  class? : String = "",
) -> @html.Html[M] {
  let header_style = @theme.get_dialog_header_style(class~)
  @html.div(class=header_style, [
    // Title with id for aria-labelledby
    @html.div(class="flex-1", [title]),
    button(variant=Ghost, [@html.text("✕")], close),
  ])
}

///|
/// Form dialog variant with title and form content
pub fn[M] form_dialog(
  id~ : String,
  title : @html.Html[M],
  content : @html.Html[M],
  submitText? : String = "Submit",
  cancelText? : String = "Cancel",
  onSubmit : M,
  onCancel : M,
  submitColor? : @theme.ButtonColor = @theme.Primary,
  size? : @theme.DialogSize = @theme.Md,
  class? : String = "",
) -> @html.Html[M] {
  dialog(
    id~,
    title~,
    content,
    footer=[
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
    ],
    size~,
    close=onCancel,
    class~,
  )
}

///|
/// Alert dialog variant with title, message and single action
pub fn[M] alert_dialog(
  id~ : String,
  title~ : @html.Html[M],
  message~ : @html.Html[M],
  button_text? : String = "OK",
  close~ : M,
  button_color? : @theme.ButtonColor = @theme.Primary,
  size? : @theme.DialogSize = @theme.Sm,
  class? : String = "",
) -> @html.Html[M] {
  dialog(
    id~,
    title~,
    message,
    footer=[
      button(
        [@html.text(button_text)],
        close,
        variant=@theme.Solid,
        color=button_color,
      ),
    ],
    size~,
    close~,
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
  id~ : String,
  title? : @html.Html[M],
  content : @html.Html[M],
  footer? : Array[@html.Html[M]],
  size? : @theme.DialogSize = @theme.Md,
  close~ : M,
  class? : String = "",
) -> @html.Html[M] {
  dialog_overlay(
    id~,
    [
      dialog_box(
        [
          // Header (optional)
          match title {
            Some(titleContent) => dialog_header(titleContent, close~)
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
    close~,
  )
}

///|
/// Simple dialog variant for basic use cases
pub fn[M] simple_dialog(
  id~ : String,
  content : @html.Html[M],
  size? : @theme.DialogSize = @theme.Md,
  close~ : M,
  class? : String = "",
) -> @html.Html[M] {
  dialog(id~, content, size~, close~, class~)
}

///|
/// Confirmation dialog variant with title and action buttons
pub fn[M] confirm_dialog(
  id~ : String,
  title~ : @html.Html[M],
  content : @html.Html[M],
  confirm_text? : String = "Confirm",
  cancel_text? : String = "Cancel",
  on_confirm~ : M,
  close~ : M,
  confirm_color? : @theme.ButtonColor = @theme.Primary,
  size? : @theme.DialogSize = @theme.Md,
  class? : String = "",
) -> @html.Html[M] {
  dialog(
    id~,
    title~,
    content,
    footer=[
      button(
        [@html.text(cancel_text)],
        close,
        variant=@theme.Ghost,
        color=@theme.Secondary,
      ),
      button(
        [@html.text(confirm_text)],
        on_confirm,
        variant=@theme.Solid,
        color=confirm_color,
      ),
    ],
    size~,
    close~,
    class~,
  )
}
