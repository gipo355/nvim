-- Made with 'mini.colors' module of https://github.com/echasnovski/mini.nvim

if vim.g.colors_name ~= nil then
    vim.cmd('highlight clear')
end
vim.g.colors_name = 'rose-pine'

-- Highlight groups
local hi = vim.api.nvim_set_hl

hi(0, '@attribute.builtin', { link = 'Special' })
hi(0, '@attribute.diff', { ctermfg = 216, fg = '#c39b62' })
hi(0, '@character.special', { link = 'Character' })
hi(0, '@class', { ctermfg = 251, fg = '#87a3a7' })
hi(0, '@comment.error', { ctermfg = 174, fg = '#b0556e' })
hi(
    0,
    '@comment.hint',
    { bg = '#414045', blend = 20, ctermbg = 238, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    '@comment.info',
    { bg = '#444444', blend = 20, ctermbg = 238, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    '@comment.note',
    { bg = '#303741', blend = 20, ctermbg = 237, ctermfg = 67, fg = '#2c667e' }
)
hi(
    0,
    '@comment.todo',
    { bg = '#403f40', blend = 20, ctermbg = 238, ctermfg = 181, fg = '#b67875' }
)
hi(0, '@comment.warning', { ctermfg = 216, fg = '#c39b62' })
hi(0, '@conceal', { link = 'Conceal' })
hi(0, '@conceal.markdown', { ctermfg = 246, fg = '#686873' })
hi(0, '@conditional', { link = 'Conditional' })
hi(0, '@constant', { ctermfg = 216, fg = '#c39b62' })
hi(0, '@constant.builtin', { bold = true, ctermfg = 216, fg = '#c39b62' })
hi(0, '@constant.macro', { ctermfg = 216, fg = '#c39b62' })
hi(0, '@constructor', { ctermfg = 251, fg = '#87a3a7' })
hi(0, '@diff.delta', { bg = '#403f40', blend = 20, ctermbg = 238 })
hi(
    0,
    '@diff.minus',
    { bg = '#423840', blend = 20, ctermbg = 237, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    '@diff.plus',
    { bg = '#444444', blend = 20, ctermbg = 238, ctermfg = 251, fg = '#87a3a7' }
)
hi(0, '@field', { ctermfg = 251, fg = '#87a3a7' })
hi(0, '@function', { ctermfg = 181, fg = '#b67875' })
hi(0, '@function.builtin', { bold = true, ctermfg = 181, fg = '#b67875' })
hi(0, '@function.macro', { link = 'Function' })
hi(0, '@function.method', { ctermfg = 181, fg = '#b67875' })
hi(0, '@function.method.call', { ctermfg = 146, fg = '#9b80b6' })
hi(0, '@ibl.indent.char.1', { fg = '#5f5f52', nocombine = true })
hi(0, '@ibl.indent.char.2', { fg = '#394b4b', nocombine = true })
hi(0, '@ibl.indent.char.3', { fg = '#463e46', nocombine = true })
hi(0, '@ibl.indent.char.4', { fg = '#313431', nocombine = true })
hi(0, '@ibl.scope.char.1', { ctermfg = 251, fg = '#87a3a7', nocombine = true })
hi(0, '@ibl.scope.underline.1', { sp = '#8ab2b9', underline = true })
hi(
    0,
    '@ibl.whitespace.char.1',
    { ctermfg = 237, fg = '#16161a', nocombine = true }
)
hi(0, '@include', { link = 'Include' })
hi(0, '@interface', { ctermfg = 251, fg = '#87a3a7' })
hi(0, '@keyword.conditional', { ctermfg = 67, fg = '#2c667e' })
hi(0, '@keyword.conditional.ternary', { ctermfg = 67, fg = '#2c667e' })
hi(0, '@keyword.debug', { ctermfg = 181, fg = '#b67875' })
hi(0, '@keyword.directive', { ctermfg = 146, fg = '#9b80b6' })
hi(0, '@keyword.directive.define', { ctermfg = 146, fg = '#9b80b6' })
hi(0, '@keyword.exception', { ctermfg = 67, fg = '#2c667e' })
hi(0, '@keyword.import', { ctermfg = 67, fg = '#2c667e' })
hi(0, '@keyword.operator', { ctermfg = 246, fg = '#686873' })
hi(0, '@keyword.repeat', { ctermfg = 67, fg = '#2c667e' })
hi(0, '@keyword.return', { ctermfg = 67, fg = '#2c667e' })
hi(0, '@keyword.storage', { ctermfg = 251, fg = '#87a3a7' })
hi(0, '@lsp.mod.deprecated', { link = 'DiagnosticDeprecated' })
hi(0, '@lsp.type.class', { link = '@type' })
hi(0, '@lsp.type.comment', {})
hi(0, '@lsp.type.decorator', { link = '@attribute' })
hi(0, '@lsp.type.enum', { link = '@type' })
hi(0, '@lsp.type.enumMember', { link = '@constant' })
hi(0, '@lsp.type.event', { link = '@type' })
hi(0, '@lsp.type.function', { link = '@function' })
hi(0, '@lsp.type.interface', { link = '@interface' })
hi(0, '@lsp.type.keyword', { link = '@keyword' })
hi(0, '@lsp.type.macro', { link = '@constant.macro' })
hi(0, '@lsp.type.method', { link = '@function.method' })
hi(0, '@lsp.type.modifier', { link = '@type.qualifier' })
hi(0, '@lsp.type.namespace', { link = '@namespace' })
hi(0, '@lsp.type.namespace.python', { link = '@variable' })
hi(0, '@lsp.type.number', { link = '@number' })
hi(0, '@lsp.type.operator', { link = '@operator' })
hi(0, '@lsp.type.parameter', { link = '@parameter' })
hi(0, '@lsp.type.property', { link = '@property' })
hi(0, '@lsp.type.regexp', { link = '@string.regexp' })
hi(0, '@lsp.type.string', { link = '@string' })
hi(0, '@lsp.type.struct', { link = '@type' })
hi(0, '@lsp.type.type', { link = '@type' })
hi(0, '@lsp.type.typeParameter', { link = '@type.definition' })
hi(0, '@lsp.type.variable', {})
hi(0, '@lsp.type.variable.svelte', { link = '@variable' })
hi(0, '@lsp.typemod.function.defaultLibrary', { link = '@function.builtin' })
hi(0, '@lsp.typemod.operator.injected', { link = '@operator' })
hi(0, '@lsp.typemod.string.injected', { link = '@string' })
hi(0, '@lsp.typemod.variable.constant', { link = '@constant' })
hi(0, '@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })
hi(0, '@lsp.typemod.variable.injected', { link = '@variable' })
hi(0, '@macro', { link = 'Macro' })
hi(0, '@markup.environment', { link = 'Macro' })
hi(0, '@markup.environment.name', { link = '@type' })
hi(0, '@markup.heading', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, '@markup.heading.1.markdown', { link = 'markdownH1' })
hi(0, '@markup.heading.1.marker.markdown', { link = 'markdownH1Delimiter' })
hi(0, '@markup.heading.2.markdown', { link = 'markdownH2' })
hi(0, '@markup.heading.2.marker.markdown', { link = 'markdownH2Delimiter' })
hi(0, '@markup.heading.3.markdown', { link = 'markdownH3' })
hi(0, '@markup.heading.3.marker.markdown', { link = 'markdownH3Delimiter' })
hi(0, '@markup.heading.4.markdown', { link = 'markdownH4' })
hi(0, '@markup.heading.4.marker.markdown', { link = 'markdownH4Delimiter' })
hi(0, '@markup.heading.5.markdown', { link = 'markdownH5' })
hi(0, '@markup.heading.5.marker.markdown', { link = 'markdownH5Delimiter' })
hi(0, '@markup.heading.6.markdown', { link = 'markdownH6' })
hi(0, '@markup.heading.6.marker.markdown', { link = 'markdownH6Delimiter' })
hi(0, '@markup.link', { link = 'Underlined' })
hi(0, '@markup.link.label.markdown_inline', { ctermfg = 251, fg = '#87a3a7' })
hi(0, '@markup.link.markdown_inline', { ctermfg = 246, fg = '#686873' })
hi(0, '@markup.link.url', { ctermfg = 146, fg = '#9b80b6' })
hi(0, '@markup.list', { ctermfg = 254, fg = '#b5b4ca' })
hi(
    0,
    '@markup.list.checked',
    { bg = '#343434', blend = 10, ctermbg = 236, ctermfg = 251, fg = '#87a3a7' }
)
hi(0, '@markup.list.unchecked', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, '@markup.math', { link = 'Special' })
hi(0, '@markup.quote', { ctermfg = 246, fg = '#686873' })
hi(0, '@markup.raw.delimiter.markdown', { ctermfg = 246, fg = '#686873' })
hi(0, '@method', { ctermfg = 181, fg = '#b67875' })
hi(0, '@module', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, '@module.builtin', { bold = true, ctermfg = 254, fg = '#b5b4ca' })
hi(0, '@namespace', { link = 'Include' })
hi(0, '@number.float', { link = 'Number' })
hi(0, '@parameter', { ctermfg = 146, fg = '#9b80b6', italic = true })
hi(0, '@preproc', { link = 'PreProc' })
hi(0, '@property', { ctermfg = 251, fg = '#87a3a7', italic = true })
hi(0, '@punctuation', { ctermfg = 246, fg = '#686873' })
hi(0, '@punctuation.bracket', { ctermfg = 246, fg = '#686873' })
hi(0, '@punctuation.delimiter', { ctermfg = 246, fg = '#686873' })
hi(0, '@punctuation.special', { ctermfg = 246, fg = '#686873' })
hi(0, '@regexp', { link = 'String' })
hi(0, '@repeat', { link = 'Repeat' })
hi(0, '@storageclass', { link = 'StorageClass' })
hi(0, '@string.escape', { ctermfg = 67, fg = '#2c667e' })
hi(0, '@string.regexp', { ctermfg = 146, fg = '#9b80b6' })
hi(0, '@string.special', { link = 'String' })
hi(0, '@string.special.symbol', { link = 'Identifier' })
hi(0, '@string.special.url', { ctermfg = 146, fg = '#9b80b6' })
hi(0, '@symbol', { link = 'Identifier' })
hi(0, '@tag.attribute', { ctermfg = 146, fg = '#9b80b6' })
hi(0, '@tag.builtin', { link = 'Special' })
hi(0, '@tag.delimiter', { ctermfg = 246, fg = '#686873' })
hi(0, '@text', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, '@text.danger', { ctermfg = 174, fg = '#b0556e' })
hi(
    0,
    '@text.diff.add',
    { bg = '#444444', blend = 20, ctermbg = 238, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    '@text.diff.delete',
    { bg = '#423840', blend = 20, ctermbg = 237, ctermfg = 174, fg = '#b0556e' }
)
hi(0, '@text.emphasis', { italic = true })
hi(0, '@text.environment', { link = 'Macro' })
hi(0, '@text.environment.name', { link = 'Type' })
hi(0, '@text.math', { link = 'Special' })
hi(0, '@text.note', { link = 'SpecialComment' })
hi(0, '@text.strike', { strikethrough = true })
hi(0, '@text.strong', { bold = true })
hi(0, '@text.title', { link = 'Title' })
hi(0, '@text.title.1.markdown', { link = 'markdownH1' })
hi(0, '@text.title.1.marker.markdown', { link = 'markdownH1Delimiter' })
hi(0, '@text.title.2.markdown', { link = 'markdownH2' })
hi(0, '@text.title.2.marker.markdown', { link = 'markdownH2Delimiter' })
hi(0, '@text.title.3.markdown', { link = 'markdownH3' })
hi(0, '@text.title.3.marker.markdown', { link = 'markdownH3Delimiter' })
hi(0, '@text.title.4.markdown', { link = 'markdownH4' })
hi(0, '@text.title.4.marker.markdown', { link = 'markdownH4Delimiter' })
hi(0, '@text.title.5.markdown', { link = 'markdownH5' })
hi(0, '@text.title.5.marker.markdown', { link = 'markdownH5Delimiter' })
hi(0, '@text.title.6.markdown', { link = 'markdownH6' })
hi(0, '@text.title.6.marker.markdown', { link = 'markdownH6Delimiter' })
hi(0, '@text.underline', { underline = true })
hi(0, '@text.uri', { ctermfg = 146, fg = '#9b80b6' })
hi(0, '@text.warning', { ctermfg = 216, fg = '#c39b62' })
hi(0, '@todo', { link = 'Todo' })
hi(0, '@type', { ctermfg = 251, fg = '#87a3a7' })
hi(0, '@type.builtin', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, '@variable', { ctermfg = 254, fg = '#b5b4ca', italic = true })
hi(0, '@variable.builtin', { bold = true, ctermfg = 174, fg = '#b0556e' })
hi(0, '@variable.member', { ctermfg = 251, fg = '#87a3a7' })
hi(0, '@variable.parameter', { ctermfg = 146, fg = '#9b80b6', italic = true })
hi(0, '@variable.parameter.builtin', { link = 'Special' })
hi(0, 'Added', { ctermfg = 194, fg = '#98c7a1' })
hi(0, 'AlphaButtons', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'AlphaFooter', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'AlphaHeader', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'AlphaShortcut', { ctermfg = 181, fg = '#b67875' })
hi(0, 'Boolean', { ctermfg = 181, fg = '#b67875' })
hi(
    0,
    'BufferCurrent',
    { bg = '#39393f', ctermbg = 237, ctermfg = 254, fg = '#b5b4ca' }
)
hi(
    0,
    'BufferCurrentIndex',
    { bg = '#39393f', ctermbg = 237, ctermfg = 254, fg = '#b5b4ca' }
)
hi(
    0,
    'BufferCurrentMod',
    { bg = '#39393f', ctermbg = 237, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'BufferCurrentSign',
    { bg = '#39393f', ctermbg = 237, ctermfg = 246, fg = '#686873' }
)
hi(
    0,
    'BufferCurrentTarget',
    { bg = '#39393f', ctermbg = 237, ctermfg = 216, fg = '#c39b62' }
)
hi(0, 'BufferInactive', { ctermfg = 246, fg = '#686873' })
hi(0, 'BufferInactiveIndex', { ctermfg = 246, fg = '#686873' })
hi(0, 'BufferInactiveMod', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'BufferInactiveSign', { ctermfg = 242, fg = '#494949' })
hi(0, 'BufferInactiveTarget', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'BufferVisible', { ctermfg = 246, fg = '#686873' })
hi(0, 'BufferVisibleIndex', { ctermfg = 246, fg = '#686873' })
hi(0, 'BufferVisibleMod', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'BufferVisibleSign', { ctermfg = 242, fg = '#494949' })
hi(0, 'BufferVisibleTarget', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'Changed', { ctermfg = 159, fg = '#7bc9c8' })
hi(0, 'Character', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'ChatGPTCompletion', { ctermfg = 247, fg = '#72727f', italic = true })
hi(0, 'ChatGPTMessageAction', {
    bg = '#2b4b5a',
    ctermbg = 238,
    ctermfg = 231,
    fg = '#d5d5d5',
    italic = true,
})
hi(0, 'ChatGPTQuestion', { ctermfg = 146, fg = '#8d95d0', italic = true })
hi(
    0,
    'ChatGPTTotalTokens',
    { bg = '#444444', ctermbg = 238, ctermfg = 231, fg = '#d5d5d5' }
)
hi(0, 'ChatGPTTotalTokensBorder', { ctermfg = 238, fg = '#202020' })
hi(0, 'ChatGPTWelcome', { ctermfg = 247, fg = '#72727f', italic = true })
hi(0, 'CmpItemAbbr', { ctermfg = 246, fg = '#686873' })
hi(0, 'CmpItemAbbrDefault', { fg = '#686873' })
hi(
    0,
    'CmpItemAbbrDeprecated',
    { ctermfg = 246, fg = '#686873', strikethrough = true }
)
hi(0, 'CmpItemAbbrDeprecatedDefault', { fg = '#494949' })
hi(0, 'CmpItemAbbrMatch', { bold = true, ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'CmpItemAbbrMatchDefault', { fg = '#686873' })
hi(0, 'CmpItemAbbrMatchFuzzy', { bold = true, ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'CmpItemAbbrMatchFuzzyDefault', { fg = '#686873' })
hi(0, 'CmpItemKind', { ctermfg = 246, fg = '#686873' })
hi(0, 'CmpItemKindClass', { link = 'StorageClass' })
hi(0, 'CmpItemKindClassDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindColorDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindConstantDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindConstructorDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindDefault', { fg = '#87a3a7' })
hi(0, 'CmpItemKindEnumDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindEnumMemberDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindEventDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindFieldDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindFileDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindFolderDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindFunction', { link = 'Function' })
hi(0, 'CmpItemKindFunctionDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindInterface', { link = 'Type' })
hi(0, 'CmpItemKindInterfaceDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindKeywordDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindMethod', { link = 'PreProc' })
hi(0, 'CmpItemKindMethodDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindModuleDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindOperatorDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindPropertyDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindReferenceDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindSnippet', { link = 'String' })
hi(0, 'CmpItemKindSnippetDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindStructDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindTextDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindTypeParameterDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindUnitDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindValueDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemKindVariable', { link = 'Identifier' })
hi(0, 'CmpItemKindVariableDefault', { link = 'CmpItemKind' })
hi(0, 'CmpItemMenuDefault', { fg = '#686873' })
hi(0, 'ColorColumn', { bg = '#2a2a30', ctermbg = 235 })
hi(0, 'Comment', { ctermfg = 242, fg = '#494949', italic = true })
hi(0, 'Conceal', {})
hi(0, 'Conditional', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'Constant', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'CopilotSuggestion', { ctermfg = 242, fg = '#494949', italic = true })
hi(0, 'CratesNvimPopupEnabled', { ctermfg = 35, fg = '#2d7c3d' })
hi(0, 'CratesNvimPopupPillBorder', { ctermfg = 237, fg = '#171717' })
hi(
    0,
    'CratesNvimPopupPillText',
    { bg = '#3a3a3a', ctermbg = 237, ctermfg = 254, fg = '#b6b6b6' }
)
hi(0, 'CratesNvimPopupTransitive', { ctermfg = 67, fg = '#266180' })
hi(
    0,
    'CurSearch',
    { bg = '#ecc48f', ctermbg = 216, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'Cursor',
    { bg = '#565656', ctermbg = 240, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'CursorColumn', { bg = '#39393f', ctermbg = 237 })
hi(0, 'CursorLine', { bg = '#39393f', ctermbg = 237 })
hi(0, 'CursorLineNr', { bold = true, ctermfg = 254, fg = '#b5b4ca' })
hi(
    0,
    'DapUIBreakpointsCurrentLine',
    { bold = true, ctermfg = 216, fg = '#c39b62' }
)
hi(0, 'DapUIBreakpointsDisabledLine', { ctermfg = 242, fg = '#494949' })
hi(0, 'DapUIBreakpointsInfo', { link = 'DapUIThread' })
hi(0, 'DapUIBreakpointsLine', { link = 'DapUIBreakpointsPath' })
hi(0, 'DapUIBreakpointsPath', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'DapUIDecoration', { link = 'DapUIBreakpointsPath' })
hi(0, 'DapUIFloatBorder', { ctermfg = 242, fg = '#494949' })
hi(0, 'DapUIFrameName', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'DapUILineNumber', { link = 'DapUIBreakpointsPath' })
hi(0, 'DapUIModifiedValue', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(
    0,
    'DapUINormalNC',
    { bg = '#171717', ctermbg = 233, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'DapUIPlayPause', { ctermfg = 156, fg = '#8cd059' })
hi(
    0,
    'DapUIPlayPauseNC',
    { bg = '#1c1c1c', ctermbg = 234, ctermfg = 156, fg = '#8cd059' }
)
hi(0, 'DapUIRestart', { ctermfg = 156, fg = '#8cd059' })
hi(
    0,
    'DapUIRestartNC',
    { bg = '#1c1c1c', ctermbg = 234, ctermfg = 156, fg = '#8cd059' }
)
hi(0, 'DapUIScope', { link = 'DapUIBreakpointsPath' })
hi(0, 'DapUISource', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'DapUIStepBack', { ctermfg = 87, fg = '#47c0c1' })
hi(
    0,
    'DapUIStepBackNC',
    { bg = '#1c1c1c', ctermbg = 234, ctermfg = 87, fg = '#47c0c1' }
)
hi(0, 'DapUIStepInto', { ctermfg = 87, fg = '#47c0c1' })
hi(
    0,
    'DapUIStepIntoNC',
    { bg = '#1c1c1c', ctermbg = 234, ctermfg = 87, fg = '#47c0c1' }
)
hi(0, 'DapUIStepOut', { ctermfg = 87, fg = '#47c0c1' })
hi(
    0,
    'DapUIStepOutNC',
    { bg = '#1c1c1c', ctermbg = 234, ctermfg = 87, fg = '#47c0c1' }
)
hi(0, 'DapUIStepOver', { ctermfg = 87, fg = '#47c0c1' })
hi(
    0,
    'DapUIStepOverNC',
    { bg = '#1c1c1c', ctermbg = 234, ctermfg = 87, fg = '#47c0c1' }
)
hi(0, 'DapUIStop', { ctermfg = 197, fg = '#a72c4f' })
hi(
    0,
    'DapUIStopNC',
    { bg = '#1c1c1c', ctermbg = 234, ctermfg = 197, fg = '#a72c4f' }
)
hi(0, 'DapUIStoppedThread', { link = 'DapUIBreakpointsPath' })
hi(0, 'DapUIThread', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'DapUIType', { ctermfg = 177, fg = '#a563ca' })
hi(0, 'DapUIUnavailable', { ctermfg = 238, fg = '#1e1e1e' })
hi(
    0,
    'DapUIUnavailableNC',
    { bg = '#1c1c1c', ctermbg = 234, ctermfg = 238, fg = '#1e1e1e' }
)
hi(0, 'DapUIValue', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'DapUIVariable', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'DapUIWatchesEmpty', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'DapUIWatchesError', { link = 'DapUIWatchesEmpty' })
hi(0, 'DapUIWatchesValue', { link = 'DapUIThread' })
hi(0, 'DapUIWinSelect', { bold = true, ctermfg = 87, fg = '#47c0c1' })
hi(0, 'DashboardCenter', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'DashboardFooter', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'DashboardHeader', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'DashboardShortcut', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'Debug', { ctermfg = 181, fg = '#b67875' })
hi(0, 'Define', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'DefinitionCount', { ctermfg = 181, fg = '#b67875' })
hi(0, 'DefinitionIcon', { ctermfg = 181, fg = '#b67875' })
hi(0, 'DefinitionPreviewTitle', { bold = true, ctermfg = 181, fg = '#b67875' })
hi(0, 'Delimiter', { ctermfg = 246, fg = '#686873' })
hi(0, 'DiagnosticDefaultError', { link = 'DiagnosticError' })
hi(0, 'DiagnosticDefaultHint', { link = 'DiagnosticHint' })
hi(0, 'DiagnosticDefaultInfo', { link = 'DiagnosticInfo' })
hi(0, 'DiagnosticDefaultWarn', { link = 'DiagnosticWarn' })
hi(0, 'DiagnosticERRORReverse', { bg = '#d87f95', fg = '#080808' })
hi(0, 'DiagnosticError', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'DiagnosticHINTReverse', { bg = '#bfacd7', fg = '#080808' })
hi(0, 'DiagnosticHint', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'DiagnosticINFOReverse', { bg = '#b2cace', fg = '#080808' })
hi(0, 'DiagnosticInfo', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'DiagnosticOk', { ctermfg = 194, fg = '#98c7a1' })
hi(0, 'DiagnosticUnderlineError', { sp = '#eb6f92', undercurl = true })
hi(0, 'DiagnosticUnderlineHint', { sp = '#c4a7e7', undercurl = true })
hi(0, 'DiagnosticUnderlineInfo', { sp = '#9ccfd8', undercurl = true })
hi(0, 'DiagnosticUnderlineWarn', { sp = '#f6c177', undercurl = true })
hi(
    0,
    'DiagnosticVirtualTextError',
    { bg = '#322e34', blend = 10, ctermbg = 236, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'DiagnosticVirtualTextHint',
    { bg = '#323238', blend = 10, ctermbg = 236, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'DiagnosticVirtualTextInfo',
    { bg = '#343434', blend = 10, ctermbg = 236, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'DiagnosticVirtualTextWarn',
    { bg = '#343434', blend = 10, ctermbg = 236, ctermfg = 216, fg = '#c39b62' }
)
hi(0, 'DiagnosticWARNReverse', { bg = '#ecc48f', fg = '#080808' })
hi(0, 'DiagnosticWarn', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'DiffAdd', { bg = '#444444', blend = 20, ctermbg = 238 })
hi(0, 'DiffChange', { bg = '#403f40', blend = 20, ctermbg = 238 })
hi(0, 'DiffDelete', { bg = '#423840', blend = 20, ctermbg = 237 })
hi(0, 'DiffText', { bg = '#403f40', blend = 20, ctermbg = 238 })
hi(0, 'DiffviewDiffAddAsDelete', { bg = '#423840', ctermbg = 237 })
hi(0, 'DiffviewDim1', { ctermfg = 242, fg = '#494949' })
hi(
    0,
    'DiffviewFilePanelCounter',
    { bold = true, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'DiffviewFilePanelFileName', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'DiffviewFilePanelTitle', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'DiffviewPrimary', { ctermfg = 181, fg = '#b67875' })
hi(0, 'DiffviewSecondary', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'Directory', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'Error', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'ErrorMsg', { bold = true, ctermfg = 174, fg = '#b0556e' })
hi(0, 'Exception', { ctermfg = 67, fg = '#2c667e' })
hi(
    0,
    'FlashLabel',
    { bg = '#d87f95', ctermbg = 174, ctermfg = 235, fg = '#080808' }
)
hi(0, 'Float', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'FloatBorder', { ctermfg = 181, fg = '#b67875' })
hi(0, 'FloatShadow', { bg = '#525252', blend = 80, ctermbg = 239 })
hi(0, 'FloatShadowThrough', { bg = '#525252', blend = 100, ctermbg = 239 })
hi(0, 'FloatTitle', { link = 'Directory' })
hi(0, 'FoldColumn', { ctermfg = 242, fg = '#494949' })
hi(
    0,
    'Folded',
    { bg = '#171717', ctermbg = 233, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'Function', { ctermfg = 181, fg = '#b67875' })
hi(0, 'FzfLuaBorder', { ctermfg = 242, fg = '#494949' })
hi(0, 'FzfLuaBufFlagAlt', { ctermfg = 246, fg = '#686873' })
hi(0, 'FzfLuaBufFlagCur', { ctermfg = 246, fg = '#686873' })
hi(0, 'FzfLuaHeaderBind', { ctermfg = 181, fg = '#b67875' })
hi(0, 'FzfLuaHeaderText', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'FzfLuaNormal', { link = 'NormalFloat' })
hi(0, 'FzfLuaTitle', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'GitSignsAdd', { link = 'SignAdd' })
hi(0, 'GitSignsChange', { link = 'SignChange' })
hi(0, 'GitSignsDelete', { link = 'SignDelete' })
hi(0, 'GitSignsStagedAdd', { ctermfg = 241, fg = '#364043' })
hi(0, 'GitSignsStagedAddLn', { bg = '#444444', ctermbg = 238 })
hi(0, 'GitSignsStagedAddNr', { ctermfg = 241, fg = '#364043' })
hi(0, 'GitSignsStagedChange', { ctermfg = 240, fg = '#3f3131' })
hi(0, 'GitSignsStagedChangeLn', { bg = '#403f40', ctermbg = 238 })
hi(0, 'GitSignsStagedChangeNr', { ctermfg = 240, fg = '#3f3131' })
hi(0, 'GitSignsStagedChangedelete', { ctermfg = 240, fg = '#3f3131' })
hi(0, 'GitSignsStagedChangedeleteLn', { bg = '#403f40', ctermbg = 238 })
hi(0, 'GitSignsStagedChangedeleteNr', { ctermfg = 240, fg = '#3f3131' })
hi(0, 'GitSignsStagedDelete', { ctermfg = 239, fg = '#411e27' })
hi(0, 'GitSignsStagedDeleteNr', { ctermfg = 239, fg = '#411e27' })
hi(0, 'GitSignsStagedTopdelete', { ctermfg = 239, fg = '#411e27' })
hi(0, 'GitSignsStagedTopdeleteNr', { ctermfg = 239, fg = '#411e27' })
hi(
    0,
    'GlanceBorderTop',
    { bg = '#2a2a2a', ctermbg = 235, ctermfg = 181, fg = '#b67875' }
)
hi(0, 'GlanceFoldIcon', { ctermfg = 248, fg = '#7e7e7e' })
hi(0, 'GlanceIndent', { ctermfg = 243, fg = '#505050' })
hi(
    0,
    'GlanceListBorderBottom',
    { bg = '#272727', ctermbg = 235, ctermfg = 181, fg = '#b67875' }
)
hi(0, 'GlanceListCursorLine', { bg = '#4b4a4e', ctermbg = 239 })
hi(
    0,
    'GlanceListEndOfBuffer',
    { bg = '#272727', ctermbg = 235, ctermfg = 235, fg = '#080808' }
)
hi(0, 'GlanceListFilepath', { ctermfg = 248, fg = '#7e7e7e' })
hi(
    0,
    'GlanceListNormal',
    { bg = '#272727', ctermbg = 235, ctermfg = 254, fg = '#b5b4ca' }
)
hi(
    0,
    'GlancePreviewBorderBottom',
    { bg = '#212121', ctermbg = 234, ctermfg = 181, fg = '#b67875' }
)
hi(0, 'GlancePreviewCursorLine', { bg = '#454448', ctermbg = 238 })
hi(
    0,
    'GlancePreviewEndOfBuffer',
    { bg = '#212121', ctermbg = 234, ctermfg = 234, fg = '#080808' }
)
hi(0, 'GlancePreviewLineNr', { ctermfg = 244, fg = '#565656' })
hi(
    0,
    'GlancePreviewMatch',
    { bg = '#e0dfed', ctermbg = 254, ctermfg = 235, fg = '#080808' }
)
hi(0, 'GlancePreviewNormal', { bg = '#212121', ctermbg = 234 })
hi(0, 'GlancePreviewSignColumn', { ctermfg = 234, fg = '#080808' })
hi(
    0,
    'GlanceWinBarFilename',
    { bg = '#2a2a2a', ctermbg = 235, ctermfg = 254, fg = '#b5b4ca' }
)
hi(
    0,
    'GlanceWinBarFilepath',
    { bg = '#2a2a2a', ctermbg = 235, ctermfg = 248, fg = '#818181' }
)
hi(
    0,
    'GlanceWinBarTitle',
    { bg = '#2a2a2a', ctermbg = 235, ctermfg = 254, fg = '#b5b4ca' }
)
hi(
    0,
    'HopNextKey',
    { bg = '#423840', blend = 20, ctermbg = 237, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'HopNextKey1',
    { bg = '#444444', blend = 20, ctermbg = 238, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'HopNextKey2',
    { bg = '#303741', blend = 20, ctermbg = 237, ctermfg = 67, fg = '#2c667e' }
)
hi(0, 'HopUnmatched', { ctermfg = 242, fg = '#494949' })
hi(0, 'IblIndent', { ctermfg = 237, fg = '#16161a' })
hi(0, 'IblScope', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'IblWhitespace', { ctermfg = 237, fg = '#16161a' })
hi(0, 'Identifier', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'IlluminatedWordRead', { link = 'LspReferenceRead' })
hi(0, 'IlluminatedWordText', { link = 'LspReferenceText' })
hi(0, 'IlluminatedWordWrite', { link = 'LspReferenceWrite' })
hi(0, 'Include', { ctermfg = 67, fg = '#2c667e' })
hi(
    0,
    'IndentBlanklineChar',
    { ctermfg = 242, fg = '#494949', nocombine = true }
)
hi(0, 'IndentBlanklineIndent1', { bg = '#2d2d1f', fg = '#212118' })
hi(0, 'IndentBlanklineIndent2', { bg = '#202c2c', fg = '#171f1f' })
hi(0, 'IndentBlanklineIndent3', { bg = '#2d242d', fg = '#1e1a1e' })
hi(0, 'IndentBlanklineIndent4', { bg = '#242d24', fg = '#1b201b' })
hi(0, 'IndentBlanklineIndentChar1', { fg = '#5f5f52' })
hi(0, 'IndentBlanklineIndentChar2', { fg = '#394b4b' })
hi(0, 'IndentBlanklineIndentChar3', { fg = '#463e46' })
hi(0, 'IndentBlanklineIndentChar4', { fg = '#313431' })
hi(
    0,
    'IndentBlanklineSpaceChar',
    { ctermfg = 242, fg = '#494949', nocombine = true }
)
hi(
    0,
    'IndentBlanklineSpaceCharBlankline',
    { ctermfg = 242, fg = '#494949', nocombine = true }
)
hi(0, 'Keyword', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'Label', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'LeapLabelPrimary', { link = 'IncSearch' })
hi(0, 'LeapLabelSecondary', { link = 'StatusLineTerm' })
hi(0, 'LeapMatch', { link = 'MatchParen' })
hi(0, 'LineNr', { ctermfg = 242, fg = '#494949' })
hi(0, 'LspCodeLens', { ctermfg = 246, fg = '#686873' })
hi(0, 'LspCodeLensSeparator', { ctermfg = 242, fg = '#494949' })
hi(0, 'LspFloatWinBorder', { ctermfg = 242, fg = '#494949' })
hi(0, 'LspFloatWinNormal', { bg = '#171717', ctermbg = 233 })
hi(
    0,
    'LspInlayHint',
    { bg = '#2b2b2f', blend = 10, ctermbg = 236, ctermfg = 242, fg = '#494949' }
)
hi(0, 'LspReferenceRead', { bg = '#454545', ctermbg = 238 })
hi(0, 'LspReferenceText', { bg = '#454545', ctermbg = 238 })
hi(0, 'LspReferenceWrite', { bg = '#454545', ctermbg = 238 })
hi(0, 'LspSagaAutoPreview', { ctermfg = 246, fg = '#686873' })
hi(0, 'LspSagaCodeActionBorder', { ctermfg = 181, fg = '#b67875' })
hi(0, 'LspSagaCodeActionContent', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'LspSagaCodeActionTitle', { bold = true, ctermfg = 216, fg = '#c39b62' })
hi(0, 'LspSagaCodeActionTruncateLine', { link = 'LspSagaCodeActionBorder' })
hi(0, 'LspSagaDefPreviewBorder', { ctermfg = 242, fg = '#494949' })
hi(0, 'LspSagaDiagnosticBorder', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'LspSagaDiagnosticHeader', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'LspSagaDiagnosticTruncateLine', { link = 'LspSagaDiagnosticBorder' })
hi(0, 'LspSagaDocTruncateLine', { link = 'LspSagaHoverBorder' })
hi(0, 'LspSagaFinderSelection', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'LspSagaHoverBorder', { link = 'LspFloatWinBorder' })
hi(0, 'LspSagaLspFinderBorder', { link = 'LspFloatWinBorder' })
hi(0, 'LspSagaRenameBorder', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'LspSagaRenamePromptPrefix', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'LspSagaShTruncateLine', { link = 'LspSagaSignatureHelpBorder' })
hi(0, 'LspSagaSignatureHelpBorder', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'LspSignatureActiveParameter', { bg = '#39393f', ctermbg = 237 })
hi(0, 'Macro', { ctermfg = 146, fg = '#9b80b6' })
hi(
    0,
    'MatchParen',
    { bg = '#333d49', blend = 25, ctermbg = 237, ctermfg = 67, fg = '#2c667e' }
)
hi(0, 'MiniClueTitle', { bg = '#171717', bold = true, ctermbg = 233 })
hi(0, 'MiniCompletionActiveParameter', { underline = true })
hi(0, 'MiniCursorword', { underline = true })
hi(
    0,
    'MiniDiffOverAdd',
    { bg = '#444444', blend = 20, ctermbg = 238, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'MiniDiffOverChange',
    { bg = '#403f40', blend = 20, ctermbg = 238, ctermfg = 181, fg = '#b67875' }
)
hi(0, 'MiniDiffOverContext', { bg = '#2a2a30', ctermbg = 235 })
hi(
    0,
    'MiniDiffOverDelete',
    { bg = '#423840', blend = 20, ctermbg = 237, ctermfg = 174, fg = '#b0556e' }
)
hi(0, 'MiniDiffSignAdd', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'MiniDiffSignChange', { ctermfg = 181, fg = '#b67875' })
hi(0, 'MiniDiffSignDelete', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'MiniIndentscopeSymbol', { ctermfg = 242, fg = '#494949' })
hi(0, 'MiniIndentscopeSymbolOff', { ctermfg = 242, fg = '#494949' })
hi(0, 'MiniPickBorderText', { bg = '#171717', ctermbg = 233 })
hi(0, 'MiniPickPrompt', { bg = '#171717', bold = true, ctermbg = 233 })
hi(
    0,
    'MiniStatuslineDevinfo',
    { bg = '#39393f', ctermbg = 237, ctermfg = 246, fg = '#686873' }
)
hi(0, 'MiniStatuslineFileinfo', { link = 'MiniStatuslineDevinfo' })
hi(
    0,
    'MiniStatuslineFilename',
    { bg = '#2a2a30', ctermbg = 235, ctermfg = 242, fg = '#494949' }
)
hi(0, 'MiniStatuslineInactive', { link = 'MiniStatuslineFilename' })
hi(
    0,
    'MiniStatuslineModeCommand',
    {
        bg = '#d87f95',
        bold = true,
        ctermbg = 174,
        ctermfg = 235,
        fg = '#080808',
    }
)
hi(
    0,
    'MiniStatuslineModeInsert',
    {
        bg = '#b2cace',
        bold = true,
        ctermbg = 251,
        ctermfg = 235,
        fg = '#080808',
    }
)
hi(
    0,
    'MiniStatuslineModeNormal',
    {
        bg = '#d9a3a0',
        bold = true,
        ctermbg = 181,
        ctermfg = 235,
        fg = '#080808',
    }
)
hi(
    0,
    'MiniStatuslineModeOther',
    {
        bg = '#d9a3a0',
        bold = true,
        ctermbg = 181,
        ctermfg = 235,
        fg = '#080808',
    }
)
hi(
    0,
    'MiniStatuslineModeReplace',
    { bg = '#568da5', bold = true, ctermbg = 67, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'MiniStatuslineModeVisual',
    {
        bg = '#bfacd7',
        bold = true,
        ctermbg = 146,
        ctermfg = 235,
        fg = '#080808',
    }
)
hi(0, 'ModeMsg', { ctermfg = 246, fg = '#686873' })
hi(0, 'ModesCopy', { bg = '#ecc48f', ctermbg = 216 })
hi(0, 'ModesDelete', { bg = '#d87f95', ctermbg = 174 })
hi(0, 'ModesInsert', { bg = '#b2cace', ctermbg = 251 })
hi(0, 'ModesVisual', { bg = '#bfacd7', ctermbg = 146 })
hi(0, 'MoreMsg', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'MultiCursor', { link = 'VM_Cursor' })
hi(0, 'NavicIconsArray', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NavicIconsBoolean', { ctermfg = 181, fg = '#b67875' })
hi(0, 'NavicIconsClass', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NavicIconsConstant', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NavicIconsConstructor', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NavicIconsEnum', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NavicIconsEnumMember', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NavicIconsEvent', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NavicIconsField', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NavicIconsFile', { ctermfg = 242, fg = '#494949' })
hi(0, 'NavicIconsFunction', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NavicIconsInterface', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NavicIconsKey', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NavicIconsKeyword', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NavicIconsMethod', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NavicIconsModule', { ctermfg = 181, fg = '#b67875' })
hi(0, 'NavicIconsNamespace', { ctermfg = 242, fg = '#494949' })
hi(0, 'NavicIconsNull', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NavicIconsNumber', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NavicIconsObject', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NavicIconsOperator', { ctermfg = 246, fg = '#686873' })
hi(0, 'NavicIconsPackage', { ctermfg = 242, fg = '#494949' })
hi(0, 'NavicIconsProperty', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NavicIconsString', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NavicIconsStruct', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NavicIconsTypeParameter', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NavicIconsVariable', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'NavicSeparator', { ctermfg = 246, fg = '#686873' })
hi(0, 'NavicText', { ctermfg = 246, fg = '#686873' })
hi(0, 'NeoTreeGitAdded', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NeoTreeGitConflict', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NeoTreeGitDeleted', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NeoTreeGitIgnored', { ctermfg = 242, fg = '#494949' })
hi(0, 'NeoTreeGitModified', { ctermfg = 181, fg = '#b67875' })
hi(0, 'NeoTreeGitRenamed', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NeoTreeGitUntracked', { ctermfg = 246, fg = '#686873' })
hi(0, 'NeoTreeTitleBar', { link = 'StatusLineTerm' })
hi(0, 'NeogitBranch', { bold = true, ctermfg = 146, fg = '#9b80b6' })
hi(
    0,
    'NeogitBranchHead',
    { bold = true, ctermfg = 146, fg = '#9b80b6', underline = true }
)
hi(
    0,
    'NeogitChangeAdded',
    { bold = true, ctermfg = 251, fg = '#87a3a7', italic = true }
)
hi(
    0,
    'NeogitChangeBothModified',
    { bold = true, ctermfg = 181, fg = '#b67875', italic = true }
)
hi(
    0,
    'NeogitChangeCopied',
    { bold = true, ctermfg = 246, fg = '#686873', italic = true }
)
hi(
    0,
    'NeogitChangeDeleted',
    { bold = true, ctermfg = 174, fg = '#b0556e', italic = true }
)
hi(
    0,
    'NeogitChangeModified',
    { bold = true, ctermfg = 181, fg = '#b67875', italic = true }
)
hi(
    0,
    'NeogitChangeNewFile',
    { bold = true, ctermfg = 146, fg = '#9b80b6', italic = true }
)
hi(
    0,
    'NeogitChangeRenamed',
    { bold = true, ctermfg = 67, fg = '#2c667e', italic = true }
)
hi(
    0,
    'NeogitChangeUnmerged',
    { bold = true, ctermfg = 139, fg = '#766a87', italic = true }
)
hi(
    0,
    'NeogitChangeUpdated',
    { bold = true, ctermfg = 181, fg = '#b67875', italic = true }
)
hi(
    0,
    'NeogitCommitViewHeader',
    { bg = '#767676', ctermbg = 243, ctermfg = 233, fg = '#080808' }
)
hi(
    0,
    'NeogitDiffAdd',
    { bg = '#444444', ctermbg = 238, ctermfg = 144, fg = '#987a51' }
)
hi(
    0,
    'NeogitDiffAddCursor',
    { bg = '#1b1b1b', ctermbg = 234, ctermfg = 216, fg = '#c39b62' }
)
hi(0, 'NeogitDiffAddHighlight', { link = 'DiffAdd' })
hi(0, 'NeogitDiffAdditions', { ctermfg = 144, fg = '#987a51' })
hi(0, 'NeogitDiffContext', { bg = '#1b1b1b', ctermbg = 234 })
hi(0, 'NeogitDiffContextCursor', { bg = '#1b1b1b', ctermbg = 234 })
hi(0, 'NeogitDiffContextHighlight', { bg = '#2a2a30', ctermbg = 235 })
hi(
    0,
    'NeogitDiffDelete',
    { bg = '#423840', ctermbg = 237, ctermfg = 132, fg = '#844456' }
)
hi(
    0,
    'NeogitDiffDeleteCursor',
    { bg = '#1b1b1b', ctermbg = 234, ctermfg = 174, fg = '#b0556e' }
)
hi(0, 'NeogitDiffDeleteHighlight', { link = 'DiffDelete' })
hi(0, 'NeogitDiffDeletions', { ctermfg = 132, fg = '#844456' })
hi(
    0,
    'NeogitDiffHeader',
    {
        bg = '#313131',
        bold = true,
        ctermbg = 236,
        ctermfg = 146,
        fg = '#9b80b6',
    }
)
hi(
    0,
    'NeogitDiffHeaderHighlight',
    {
        bg = '#313131',
        bold = true,
        ctermbg = 236,
        ctermfg = 251,
        fg = '#87a3a7',
    }
)
hi(0, 'NeogitFilePath', { ctermfg = 251, fg = '#87a3a7', italic = true })
hi(0, 'NeogitFloatHeader', { bg = '#171717', bold = true, ctermbg = 233 })
hi(
    0,
    'NeogitFloatHeaderHighlight',
    {
        bg = '#262626',
        bold = true,
        ctermbg = 235,
        ctermfg = 246,
        fg = '#686873',
    }
)
hi(0, 'NeogitGraphAuthor', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NeogitGraphBlue', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NeogitGraphBoldBlue', { bold = true, ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NeogitGraphBoldCyan', { bold = true, ctermfg = 246, fg = '#686873' })
hi(0, 'NeogitGraphBoldGray', { bold = true, ctermfg = 243, fg = '#4f4f4f' })
hi(0, 'NeogitGraphBoldGreen', { bold = true, ctermfg = 216, fg = '#c39b62' })
hi(0, 'NeogitGraphBoldOrange', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NeogitGraphBoldPurple', { bold = true, ctermfg = 67, fg = '#2c667e' })
hi(0, 'NeogitGraphBoldRed', { bold = true, ctermfg = 174, fg = '#b0556e' })
hi(0, 'NeogitGraphBoldWhite', { bold = true, ctermfg = 231, fg = '#d2d2d2' })
hi(0, 'NeogitGraphBoldYellow', { bold = true, ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NeogitGraphCyan', { ctermfg = 246, fg = '#686873' })
hi(0, 'NeogitGraphGray', { ctermfg = 243, fg = '#4f4f4f' })
hi(0, 'NeogitGraphGreen', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NeogitGraphOrange', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NeogitGraphPurple', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NeogitGraphRed', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NeogitGraphWhite', { ctermfg = 231, fg = '#d2d2d2' })
hi(0, 'NeogitGraphYellow', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NeogitHunkHeader', { bg = '#171717', ctermbg = 233 })
hi(
    0,
    'NeogitHunkHeaderCursor',
    {
        bg = '#77a0b2',
        bold = true,
        ctermbg = 109,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(0, 'NeogitHunkHeaderHighlight', { bg = '#171717', ctermbg = 233 })
hi(0, 'NeogitHunkMergeHeader', { bg = '#747474', bold = true, fg = '#080808' })
hi(
    0,
    'NeogitHunkMergeHeaderCursor',
    { bg = '#767677', bold = true, fg = '#080808' }
)
hi(
    0,
    'NeogitHunkMergeHeaderHighlight',
    { bg = '#767677', bold = true, fg = '#080808' }
)
hi(0, 'NeogitPopupActionKey', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NeogitPopupBold', { bold = true })
hi(0, 'NeogitPopupConfigKey', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NeogitPopupOptionKey', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NeogitPopupSwitchKey', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NeogitRemote', { bold = true, ctermfg = 216, fg = '#c39b62' })
hi(0, 'NeogitSectionHeader', { bold = true, ctermfg = 242, fg = '#1e4e61' })
hi(0, 'NeogitTagDistance', { ctermfg = 246, fg = '#686873' })
hi(0, 'NeogitTagName', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NeogitUnmergedInto', { bold = true, ctermfg = 242, fg = '#1e4e61' })
hi(0, 'NeogitUnpulledFrom', { bold = true, ctermfg = 242, fg = '#1e4e61' })
hi(0, 'NeogitUnpushedTo', { bold = true, ctermfg = 242, fg = '#1e4e61' })
hi(0, 'NeorgHeading1Prefix', { link = 'markdownH1Delimiter' })
hi(0, 'NeorgHeading1Title', { link = 'markdownH1' })
hi(0, 'NeorgHeading2Prefix', { link = 'markdownH2Delimiter' })
hi(0, 'NeorgHeading2Title', { link = 'markdownH2' })
hi(0, 'NeorgHeading3Prefix', { link = 'markdownH3Delimiter' })
hi(0, 'NeorgHeading3Title', { link = 'markdownH3' })
hi(0, 'NeorgHeading4Prefix', { link = 'markdownH4Delimiter' })
hi(0, 'NeorgHeading4Title', { link = 'markdownH4' })
hi(0, 'NeorgHeading5Prefix', { link = 'markdownH5Delimiter' })
hi(0, 'NeorgHeading5Title', { link = 'markdownH5' })
hi(0, 'NeorgHeading6Prefix', { link = 'markdownH6Delimiter' })
hi(0, 'NeorgHeading6Title', { link = 'markdownH6' })
hi(0, 'NeorgMarkerTitle', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NeotestAdapterName', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NeotestBorder', { ctermfg = 238, fg = '#212121' })
hi(0, 'NeotestDir', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NeotestExpandMarker', { ctermfg = 238, fg = '#212121' })
hi(0, 'NeotestFailed', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NeotestFile', { ctermfg = 254, fg = '#b5b4ca' })
hi(
    0,
    'NeotestFocused',
    { bg = '#454545', ctermbg = 238, ctermfg = 216, fg = '#c39b62' }
)
hi(0, 'NeotestMarked', { bold = true, ctermfg = 181, fg = '#b67875' })
hi(0, 'NeotestNamespace', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NeotestPassed', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NeotestRunning', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NeotestSkipped', { ctermfg = 246, fg = '#686873' })
hi(0, 'NeotestTarget', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NeotestTest', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NeotestUnknown', { ctermfg = 246, fg = '#686873' })
hi(0, 'NeotestWatching', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NeotestWinSelect', { ctermfg = 242, fg = '#494949' })
hi(
    0,
    'NoiceCursor',
    { bg = '#e0dfed', ctermbg = 254, ctermfg = 240, fg = '#323232' }
)
hi(0, 'NoiceFormatProgressDone', { bg = '#e0dfed', fg = '#080808' })
hi(0, 'NoiceHiddenCursor', { blend = 100, nocombine = true })
hi(0, 'NonText', { ctermfg = 242, fg = '#494949' })
hi(
    0,
    'Normal',
    { bg = '#171717', ctermbg = 233, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'NormalFloat', { bg = '#171717', ctermbg = 233 })
hi(
    0,
    'NormalNC',
    { bg = '#242328', ctermbg = 235, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'NotifyDEBUGBorder', { ctermfg = 242, fg = '#494949' })
hi(0, 'NotifyDEBUGIcon', { link = 'NotifyDEBUGTitle' })
hi(0, 'NotifyDEBUGTitle', { ctermfg = 242, fg = '#494949' })
hi(0, 'NotifyERRORBorder', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NotifyERRORIcon', { link = 'NotifyERRORTitle' })
hi(0, 'NotifyERRORTitle', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NotifyINFOBorder', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NotifyINFOIcon', { link = 'NotifyINFOTitle' })
hi(0, 'NotifyINFOTitle', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NotifyTRACEBorder', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NotifyTRACEIcon', { link = 'NotifyTRACETitle' })
hi(0, 'NotifyTRACETitle', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NotifyWARNBorder', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NotifyWARNIcon', { link = 'NotifyWARNTitle' })
hi(0, 'NotifyWARNTitle', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'Number', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'NvimInternalError', { link = 'ErrorMsg' })
hi(
    0,
    'NvimTreeCombinedHLba30d17e77ba9ffb01a002a06457713a840aa4cc31b74d845b797031eb0a60f6',
    { bg = '#39393f', ctermbg = 237, ctermfg = 254, fg = '#b5b4ca' }
)
hi(
    0,
    'NvimTreeCombinedHLe292ba741725fba2a6e08de1418f742f3c6f92e3d113c9273dca3c10385b02cc',
    { bg = '#39393f', ctermbg = 237, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'NvimTreeEmptyFolderName', { ctermfg = 242, fg = '#494949' })
hi(0, 'NvimTreeFileDeleted', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NvimTreeFileDirty', { ctermfg = 181, fg = '#b67875' })
hi(0, 'NvimTreeFileMerge', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NvimTreeFileNew', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NvimTreeFileRenamed', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NvimTreeFileStaged', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NvimTreeFolderIcon', { ctermfg = 246, fg = '#686873' })
hi(0, 'NvimTreeFolderName', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NvimTreeGitDeleted', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'NvimTreeGitDeletedIcon', { link = 'NvimTreeGitDeleted' })
hi(0, 'NvimTreeGitDirty', { ctermfg = 181, fg = '#b67875' })
hi(0, 'NvimTreeGitDirtyIcon', { link = 'NvimTreeGitDirty' })
hi(0, 'NvimTreeGitFileDeletedHL', { link = 'NvimTreeFileDeleted' })
hi(0, 'NvimTreeGitFileDirtyHL', { link = 'NvimTreeFileDirty' })
hi(0, 'NvimTreeGitFileMergeHL', { link = 'NvimTreeFileMerge' })
hi(0, 'NvimTreeGitFileNewHL', { link = 'NvimTreeFileNew' })
hi(0, 'NvimTreeGitFileRenamedHL', { link = 'NvimTreeFileRenamed' })
hi(0, 'NvimTreeGitFileStagedHL', { link = 'NvimTreeFileStaged' })
hi(0, 'NvimTreeGitIgnored', { ctermfg = 242, fg = '#494949' })
hi(0, 'NvimTreeGitIgnoredIcon', { link = 'NvimTreeGitIgnored' })
hi(0, 'NvimTreeGitMerge', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NvimTreeGitMergeIcon', { link = 'NvimTreeGitMerge' })
hi(0, 'NvimTreeGitNew', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NvimTreeGitNewIcon', { link = 'NvimTreeGitNew' })
hi(0, 'NvimTreeGitRenamed', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'NvimTreeGitRenamedIcon', { link = 'NvimTreeGitRenamed' })
hi(0, 'NvimTreeGitStaged', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'NvimTreeGitStagedIcon', { link = 'NvimTreeGitStaged' })
hi(0, 'NvimTreeImageFile', { ctermfg = 254, fg = '#b5b4ca' })
hi(
    0,
    'NvimTreeOpenedFile',
    { bg = '#39393f', ctermbg = 237, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'NvimTreeOpenedFolderName', { link = 'NvimTreeFolderName' })
hi(0, 'NvimTreeOpenedHL', { link = 'NvimTreeOpenedFile' })
hi(0, 'NvimTreeRootFolder', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'NvimTreeSpecialFile', { link = 'NvimTreeNormal' })
hi(0, 'NvimTreeWindowPicker', { link = 'StatusLineTerm' })
hi(0, 'Operator', { ctermfg = 246, fg = '#686873' })
hi(0, 'Pmenu', { bg = '#171717', ctermbg = 233, ctermfg = 246, fg = '#686873' })
hi(
    0,
    'PmenuExtra',
    { bg = '#171717', ctermbg = 233, ctermfg = 242, fg = '#494949' }
)
hi(
    0,
    'PmenuExtraSel',
    { bg = '#39393f', ctermbg = 237, ctermfg = 246, fg = '#686873' }
)
hi(
    0,
    'PmenuKind',
    { bg = '#171717', ctermbg = 233, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'PmenuKindSel',
    { bg = '#39393f', ctermbg = 237, ctermfg = 246, fg = '#686873' }
)
hi(0, 'PmenuSbar', { bg = '#171717', ctermbg = 233 })
hi(
    0,
    'PmenuSel',
    { bg = '#39393f', ctermbg = 237, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'PmenuThumb', { bg = '#6e6e6e', ctermbg = 242 })
hi(
    0,
    'PounceAccept',
    { bg = '#423840', blend = 20, ctermbg = 237, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'PounceAcceptBest',
    { bg = '#444444', blend = 20, ctermbg = 238, ctermfg = 216, fg = '#c39b62' }
)
hi(0, 'PounceGap', { link = 'Search' })
hi(0, 'PounceMatch', { link = 'Search' })
hi(0, 'PreCondit', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'PreProc', { link = 'PreCondit' })
hi(0, 'Question', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'QuickFixLine', { ctermfg = 159, fg = '#7bc9c8' })
hi(
    0,
    'RedrawDebugClear',
    { bg = '#ecc48f', ctermbg = 216, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'RedrawDebugComposed',
    { bg = '#568da5', ctermbg = 67, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'RedrawDebugRecompose',
    { bg = '#d87f95', ctermbg = 174, ctermfg = 235, fg = '#080808' }
)
hi(0, 'ReferencesCount', { ctermfg = 181, fg = '#b67875' })
hi(0, 'ReferencesIcon', { ctermfg = 181, fg = '#b67875' })
hi(0, 'Removed', { ctermfg = 224, fg = '#d39991' })
hi(0, 'Repeat', { ctermfg = 67, fg = '#2c667e' })
hi(0, 'SagaActionTitle', { bg = '#ab89cf', fg = '#000000' })
hi(0, 'SagaBeacon', { bg = '#b34f67', ctermbg = 131 })
hi(0, 'SagaButton', { fg = '#9b80b6' })
hi(
    0,
    'SagaCount',
    {
        bg = '#808080',
        bold = true,
        ctermbg = 244,
        ctermfg = 231,
        fg = '#d5d5d5',
    }
)
hi(0, 'SagaShadow', { bg = '#39393f', ctermbg = 237 })
hi(0, 'SagaVirtLine', { ctermfg = 239, fg = '#262626' })
hi(0, 'SatelliteCursor', { ctermfg = 242, fg = '#494949' })
hi(0, 'SatelliteMark', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'SatelliteSearch', { ctermfg = 254, fg = '#b5b4ca' })
hi(
    0,
    'Search',
    { bg = '#e0dfed', ctermbg = 254, ctermfg = 235, fg = '#080808' }
)
hi(0, 'SignAdd', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'SignChange', { ctermfg = 181, fg = '#b67875' })
hi(0, 'SignColumn', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'SignDelete', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'Special', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'SpecialComment', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'SpecialKey', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'SpectreBody', { link = 'String' })
hi(0, 'SpectreBorder', { link = 'Comment' })
hi(0, 'SpectreDir', { link = 'Comment' })
hi(0, 'SpectreFile', { link = 'Keyword' })
hi(0, 'SpectreHeader', { link = 'Comment' })
hi(0, 'SpectreReplace', { link = 'DiffDelete' })
hi(0, 'SpectreSearch', { link = 'DiffChange' })
hi(0, 'SpellBad', { sp = '#908caa', undercurl = true })
hi(0, 'SpellCap', { sp = '#908caa', undercurl = true })
hi(0, 'SpellLocal', { sp = '#908caa', undercurl = true })
hi(0, 'SpellRare', { sp = '#908caa', undercurl = true })
hi(0, 'Statement', { bold = true, ctermfg = 67, fg = '#2c667e' })
hi(
    0,
    'StatusLine',
    { bg = '#171717', ctermbg = 233, ctermfg = 246, fg = '#686873' }
)
hi(
    0,
    'StatusLineNC',
    { bg = '#1c1c1c', blend = 60, ctermbg = 234, ctermfg = 242, fg = '#494949' }
)
hi(
    0,
    'StatusLineTerm',
    { bg = '#568da5', ctermbg = 67, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'StatusLineTermNC',
    { bg = '#426275', blend = 60, ctermbg = 59, ctermfg = 235, fg = '#080808' }
)
hi(0, 'StorageClass', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'String', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'Structure', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'Substitute', { link = 'IncSearch' })
hi(
    0,
    'TabLine',
    { bg = '#171717', ctermbg = 233, ctermfg = 246, fg = '#686873' }
)
hi(0, 'TabLineFill', { bg = '#171717', ctermbg = 233 })
hi(
    0,
    'TabLineSel',
    {
        bg = '#39393f',
        bold = true,
        ctermbg = 237,
        ctermfg = 254,
        fg = '#b5b4ca',
    }
)
hi(0, 'Tag', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'TailwindConceal', { fg = '#3faee2' })
hi(0, 'TargetWord', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'TelescopeBorder', { ctermfg = 242, fg = '#494949' })
hi(
    0,
    'TelescopeMatching',
    { bg = '#e0dfed', ctermbg = 254, ctermfg = 235, fg = '#080808' }
)
hi(0, 'TelescopeNormal', { link = 'NormalFloat' })
hi(0, 'TelescopePreviewLine', { link = 'Search' })
hi(0, 'TelescopePromptNormal', { link = 'TelescopeNormal' })
hi(0, 'TelescopePromptPrefix', { ctermfg = 246, fg = '#686873' })
hi(
    0,
    'TelescopeSelection',
    { bg = '#39393f', ctermbg = 237, ctermfg = 254, fg = '#b5b4ca' }
)
hi(
    0,
    'TelescopeSelectionCaret',
    { bg = '#39393f', ctermbg = 237, ctermfg = 181, fg = '#b67875' }
)
hi(0, 'TelescopeTitle', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'Title', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(
    0,
    'Todo',
    { bg = '#403f40', blend = 20, ctermbg = 238, ctermfg = 181, fg = '#b67875' }
)
hi(
    0,
    'TodoBgCURRENT',
    {
        bg = '#ecc48f',
        bold = true,
        ctermbg = 216,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(
    0,
    'TodoBgFIX',
    {
        bg = '#d87f95',
        bold = true,
        ctermbg = 174,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(
    0,
    'TodoBgHACK',
    {
        bg = '#ecc48f',
        bold = true,
        ctermbg = 216,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(
    0,
    'TodoBgIMP',
    {
        bg = '#d87f95',
        bold = true,
        ctermbg = 174,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(
    0,
    'TodoBgNOTE',
    {
        bg = '#bfacd7',
        bold = true,
        ctermbg = 146,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(
    0,
    'TodoBgPERF',
    {
        bg = '#e0dfed',
        bold = true,
        ctermbg = 254,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(
    0,
    'TodoBgSECURITY',
    {
        bg = '#d87f95',
        bold = true,
        ctermbg = 174,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(
    0,
    'TodoBgTEST',
    {
        bg = '#e0dfed',
        bold = true,
        ctermbg = 254,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(
    0,
    'TodoBgTODO',
    {
        bg = '#b2cace',
        bold = true,
        ctermbg = 251,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(0, 'TodoBgUSERINPUT', { bg = '#d87f95', bold = true, fg = '#080808' })
hi(0, 'TodoBgVULNERABILITY', { bg = '#d87f95', bold = true, fg = '#080808' })
hi(
    0,
    'TodoBgWARN',
    {
        bg = '#ecc48f',
        bold = true,
        ctermbg = 216,
        ctermfg = 233,
        fg = '#080808',
    }
)
hi(0, 'TodoFgCURRENT', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'TodoFgFIX', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'TodoFgHACK', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'TodoFgIMP', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'TodoFgNOTE', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'TodoFgPERF', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'TodoFgSECURITY', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'TodoFgTEST', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'TodoFgTODO', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'TodoFgUSERINPUT', { fg = '#b0556e' })
hi(0, 'TodoFgVULNERABILITY', { fg = '#b0556e' })
hi(0, 'TodoFgWARN', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'TodoSignCURRENT', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'TodoSignFIX', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'TodoSignHACK', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'TodoSignIMP', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'TodoSignNOTE', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'TodoSignPERF', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'TodoSignSECURITY', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'TodoSignTEST', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'TodoSignTODO', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'TodoSignUSERINPUT', { fg = '#b0556e' })
hi(0, 'TodoSignVULNERABILITY', { fg = '#b0556e' })
hi(0, 'TodoSignWARN', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'ToggleTerm99FloatBorder', { link = 'Normal' })
hi(0, 'ToggleTerm99NormalFloat', { link = 'Normal' })
hi(0, 'TreesitterContext', { bg = '#39393f', ctermbg = 237 })
hi(
    0,
    'TreesitterContextLineNumber',
    { bg = '#39393f', ctermbg = 237, ctermfg = 181, fg = '#b67875' }
)
hi(
    0,
    'TroubleCount',
    { bg = '#2a2a30', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'TroubleNormal',
    { bg = '#171717', ctermbg = 233, ctermfg = 254, fg = '#b5b4ca' }
)
hi(0, 'TroubleText', { ctermfg = 246, fg = '#686873' })
hi(0, 'Type', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'UfoFoldedBg', { bg = '#171717', ctermbg = 233 })
hi(0, 'UfoFoldedFg', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'Underlined', { ctermfg = 146, fg = '#9b80b6', underline = true })
hi(0, 'VertSplit', { ctermfg = 242, fg = '#494949' })
hi(0, 'VimwikiHR', { ctermfg = 246, fg = '#686873' })
hi(0, 'VimwikiHeader1', { link = 'markdownH1' })
hi(0, 'VimwikiHeader2', { link = 'markdownH2' })
hi(0, 'VimwikiHeader3', { link = 'markdownH3' })
hi(0, 'VimwikiHeader4', { link = 'markdownH4' })
hi(0, 'VimwikiHeader5', { link = 'markdownH5' })
hi(0, 'VimwikiHeader6', { link = 'markdownH6' })
hi(0, 'VimwikiHeaderChar', { ctermfg = 246, fg = '#686873' })
hi(0, 'VimwikiLink', { link = 'markdownUrl' })
hi(0, 'VimwikiList', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'VimwikiNoExistsLink', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'Visual', { bg = '#454545', ctermbg = 238 })
hi(0, 'WarningMsg', { bold = true, ctermfg = 216, fg = '#c39b62' })
hi(0, 'WhichKey', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'WhichKeyDesc', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'WhichKeyFloat', { bg = '#171717', ctermbg = 233 })
hi(0, 'WhichKeyGroup', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'WhichKeySeparator', { ctermfg = 246, fg = '#686873' })
hi(0, 'WhichKeyValue', { ctermfg = 181, fg = '#b67875' })
hi(0, 'WildMenu', { link = 'IncSearch' })
hi(
    0,
    'WinBar',
    { bg = '#171717', ctermbg = 233, ctermfg = 246, fg = '#686873' }
)
hi(
    0,
    'WinBarNC',
    { bg = '#1c1c1c', blend = 60, ctermbg = 234, ctermfg = 242, fg = '#494949' }
)
hi(0, 'WinSeparator', { ctermfg = 242, fg = '#494949' })
hi(
    0,
    'WinShiftCursorLineNr',
    {
        bg = '#454545',
        bold = true,
        ctermbg = 238,
        ctermfg = 254,
        fg = '#b5b4ca',
    }
)
hi(
    0,
    'WinShiftEndOfBuffer',
    { bg = '#454545', ctermbg = 238, ctermfg = 238, fg = '#393939' }
)
hi(
    0,
    'WinShiftFoldColumn',
    { bg = '#454545', ctermbg = 238, ctermfg = 242, fg = '#494949' }
)
hi(
    0,
    'WinShiftLineNr',
    { bg = '#454545', ctermbg = 238, ctermfg = 242, fg = '#494949' }
)
hi(0, 'WinShiftNormal', { bg = '#454545', ctermbg = 238 })
hi(
    0,
    'WinShiftSignColumn',
    { bg = '#454545', ctermbg = 238, ctermfg = 254, fg = '#b5b4ca' }
)
hi(
    0,
    'WinShiftWindowPicker',
    { bg = '#4493c8', bold = true, ctermbg = 67, ctermfg = 255, fg = '#dfdfdf' }
)
hi(0, 'diffAdded', { link = 'DiffAdd' })
hi(0, 'diffChanged', { link = 'DiffChange' })
hi(0, 'diffRemoved', { link = 'DiffDelete' })
hi(0, 'healthError', { ctermfg = 174, fg = '#b0556e' })
hi(0, 'healthSuccess', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'healthWarning', { ctermfg = 216, fg = '#c39b62' })
hi(0, 'htmlArg', { ctermfg = 146, fg = '#9b80b6' })
hi(0, 'htmlBold', { bold = true })
hi(0, 'htmlBoldItalic', { bold = true, italic = true })
hi(0, 'htmlBoldUnderline', { bold = true, underline = true })
hi(
    0,
    'htmlBoldUnderlineItalic',
    { bold = true, italic = true, underline = true }
)
hi(0, 'htmlEndTag', { ctermfg = 246, fg = '#686873' })
hi(0, 'htmlH1', { link = 'markdownH1' })
hi(0, 'htmlH2', { link = 'markdownH2' })
hi(0, 'htmlH3', { link = 'markdownH3' })
hi(0, 'htmlH4', { link = 'markdownH4' })
hi(0, 'htmlH5', { link = 'markdownH5' })
hi(0, 'htmlItalic', { italic = true })
hi(0, 'htmlLink', { link = 'markdownUrl' })
hi(0, 'htmlStrike', { strikethrough = true })
hi(0, 'htmlTag', { ctermfg = 246, fg = '#686873' })
hi(0, 'htmlTagN', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'htmlTagName', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'htmlUnderline', { underline = true })
hi(0, 'htmlUnderlineItalic', { italic = true, underline = true })
hi(
    0,
    'lCursor',
    { bg = '#e0dfed', ctermbg = 254, ctermfg = 233, fg = '#080808' }
)
hi(0, 'lualine_a_13_command', { bg = '#eb6f92', fg = '#0c0b11' })
hi(0, 'lualine_a_13_inactive', { bg = '#191724', fg = '#62616a' })
hi(0, 'lualine_a_13_insert', { bg = '#9ccfd8', fg = '#0c0b11' })
hi(0, 'lualine_a_13_normal', { bg = '#ebbcba', fg = '#0c0b11' })
hi(0, 'lualine_a_13_replace', { bg = '#31748f', fg = '#0c0b11' })
hi(0, 'lualine_a_13_terminal', { bg = '#ebbcba', fg = '#0c0b11' })
hi(0, 'lualine_a_13_visual', { bg = '#c4a7e7', fg = '#0c0b11' })
hi(
    0,
    'lualine_a_16_command',
    { bg = '#d87f95', ctermbg = 174, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'lualine_a_16_inactive',
    { bg = '#242328', ctermbg = 235, ctermfg = 242, fg = '#494949' }
)
hi(
    0,
    'lualine_a_16_insert',
    { bg = '#b2cace', ctermbg = 251, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'lualine_a_16_normal',
    { bg = '#d9a3a0', ctermbg = 181, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'lualine_a_16_replace',
    { bg = '#568da5', ctermbg = 67, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'lualine_a_16_terminal',
    { bg = '#d9a3a0', ctermbg = 181, ctermfg = 235, fg = '#080808' }
)
hi(
    0,
    'lualine_a_16_visual',
    { bg = '#bfacd7', ctermbg = 146, ctermfg = 235, fg = '#080808' }
)
hi(0, 'lualine_a_17_command', { bg = '#eb6f92', fg = '#242331' })
hi(0, 'lualine_a_17_inactive', { bg = '#191724', fg = '#7b759e' })
hi(0, 'lualine_a_17_insert', { bg = '#9ccfd8', fg = '#242331' })
hi(0, 'lualine_a_17_normal', { bg = '#ebbcba', fg = '#242331' })
hi(0, 'lualine_a_17_replace', { bg = '#31748f', fg = '#242331' })
hi(0, 'lualine_a_17_terminal', { bg = '#ebbcba', fg = '#242331' })
hi(0, 'lualine_a_17_visual', { bg = '#c4a7e7', fg = '#242331' })
hi(0, 'lualine_a_23_command', { bg = '#eb6f92', fg = '#0c0b11' })
hi(0, 'lualine_a_23_inactive', { bg = '#191724', fg = '#62616a' })
hi(0, 'lualine_a_23_insert', { bg = '#9ccfd8', fg = '#0c0b11' })
hi(0, 'lualine_a_23_normal', { bg = '#ebbcba', fg = '#0c0b11' })
hi(0, 'lualine_a_23_replace', { bg = '#31748f', fg = '#0c0b11' })
hi(0, 'lualine_a_23_terminal', { bg = '#ebbcba', fg = '#0c0b11' })
hi(0, 'lualine_a_23_visual', { bg = '#c4a7e7', fg = '#0c0b11' })
hi(
    0,
    'lualine_a_6_command',
    { bg = '#eb6f92', ctermbg = 174, ctermfg = 235, fg = '#242331' }
)
hi(
    0,
    'lualine_a_6_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 242, fg = '#7b759e' }
)
hi(
    0,
    'lualine_a_6_insert',
    { bg = '#9ccfd8', ctermbg = 251, ctermfg = 235, fg = '#242331' }
)
hi(
    0,
    'lualine_a_6_normal',
    { bg = '#ebbcba', ctermbg = 181, ctermfg = 235, fg = '#242331' }
)
hi(
    0,
    'lualine_a_6_replace',
    { bg = '#31748f', ctermbg = 67, ctermfg = 235, fg = '#242331' }
)
hi(
    0,
    'lualine_a_6_terminal',
    { bg = '#ebbcba', ctermbg = 181, ctermfg = 235, fg = '#242331' }
)
hi(
    0,
    'lualine_a_6_visual',
    { bg = '#c4a7e7', ctermbg = 146, ctermfg = 235, fg = '#242331' }
)
hi(
    0,
    'lualine_a_command',
    {
        bg = '#eb6f92',
        bold = true,
        ctermbg = 174,
        ctermfg = 235,
        fg = '#0c0b11',
    }
)
hi(
    0,
    'lualine_a_inactive',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 242,
        fg = '#62616a',
    }
)
hi(
    0,
    'lualine_a_insert',
    {
        bg = '#9ccfd8',
        bold = true,
        ctermbg = 251,
        ctermfg = 235,
        fg = '#0c0b11',
    }
)
hi(
    0,
    'lualine_a_normal',
    {
        bg = '#ebbcba',
        bold = true,
        ctermbg = 181,
        ctermfg = 235,
        fg = '#0c0b11',
    }
)
hi(
    0,
    'lualine_a_replace',
    { bg = '#31748f', bold = true, ctermbg = 67, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_a_visual',
    {
        bg = '#c4a7e7',
        bold = true,
        ctermbg = 146,
        ctermfg = 235,
        fg = '#0c0b11',
    }
)
hi(0, 'lualine_b_12_command', { bg = '#26233a', bold = true, fg = '#d36a87' })
hi(0, 'lualine_b_12_inactive', { bg = '#191724', bold = true, fg = '#62616a' })
hi(0, 'lualine_b_12_insert', { bg = '#26233a', bold = true, fg = '#9bbec5' })
hi(0, 'lualine_b_12_normal', { bg = '#26233a', bold = true, fg = '#d6b1af' })
hi(0, 'lualine_b_12_replace', { bg = '#26233a', bold = true, fg = '#2f667d' })
hi(0, 'lualine_b_12_terminal', { bg = '#26233a', bold = true, fg = '#d6b1af' })
hi(0, 'lualine_b_12_visual', { bg = '#26233a', bold = true, fg = '#b49dd1' })
hi(
    0,
    'lualine_b_15_command',
    {
        bg = '#39393f',
        bold = true,
        ctermbg = 237,
        ctermfg = 174,
        fg = '#b0556e',
    }
)
hi(
    0,
    'lualine_b_15_inactive',
    {
        bg = '#242328',
        bold = true,
        ctermbg = 235,
        ctermfg = 242,
        fg = '#494949',
    }
)
hi(
    0,
    'lualine_b_15_insert',
    {
        bg = '#39393f',
        bold = true,
        ctermbg = 237,
        ctermfg = 251,
        fg = '#87a3a7',
    }
)
hi(
    0,
    'lualine_b_15_normal',
    {
        bg = '#39393f',
        bold = true,
        ctermbg = 237,
        ctermfg = 181,
        fg = '#b67875',
    }
)
hi(
    0,
    'lualine_b_15_replace',
    { bg = '#39393f', bold = true, ctermbg = 237, ctermfg = 67, fg = '#2c667e' }
)
hi(
    0,
    'lualine_b_15_terminal',
    {
        bg = '#39393f',
        bold = true,
        ctermbg = 237,
        ctermfg = 181,
        fg = '#b67875',
    }
)
hi(
    0,
    'lualine_b_15_visual',
    {
        bg = '#39393f',
        bold = true,
        ctermbg = 237,
        ctermfg = 146,
        fg = '#9b80b6',
    }
)
hi(0, 'lualine_b_16_command', { bg = '#26233a', bold = true, fg = '#e883a1' })
hi(0, 'lualine_b_16_inactive', { bg = '#191724', bold = true, fg = '#7b759e' })
hi(0, 'lualine_b_16_insert', { bg = '#26233a', bold = true, fg = '#9fe0ec' })
hi(0, 'lualine_b_16_normal', { bg = '#26233a', bold = true, fg = '#edcbca' })
hi(0, 'lualine_b_16_replace', { bg = '#26233a', bold = true, fg = '#3b819d' })
hi(0, 'lualine_b_16_terminal', { bg = '#26233a', bold = true, fg = '#edcbca' })
hi(0, 'lualine_b_16_visual', { bg = '#26233a', bold = true, fg = '#d1b7ec' })
hi(0, 'lualine_b_22_command', { bg = '#26233a', bold = true, fg = '#d36a87' })
hi(0, 'lualine_b_22_inactive', { bg = '#191724', bold = true, fg = '#62616a' })
hi(0, 'lualine_b_22_insert', { bg = '#26233a', bold = true, fg = '#9bbec5' })
hi(0, 'lualine_b_22_normal', { bg = '#26233a', bold = true, fg = '#d6b1af' })
hi(0, 'lualine_b_22_replace', { bg = '#26233a', bold = true, fg = '#2f667d' })
hi(0, 'lualine_b_22_terminal', { bg = '#26233a', bold = true, fg = '#d6b1af' })
hi(0, 'lualine_b_22_visual', { bg = '#26233a', bold = true, fg = '#b49dd1' })
hi(
    0,
    'lualine_b_5_command',
    {
        bg = '#26233a',
        bold = true,
        ctermbg = 237,
        ctermfg = 174,
        fg = '#e883a1',
    }
)
hi(
    0,
    'lualine_b_5_inactive',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 242,
        fg = '#7b759e',
    }
)
hi(
    0,
    'lualine_b_5_insert',
    {
        bg = '#26233a',
        bold = true,
        ctermbg = 237,
        ctermfg = 251,
        fg = '#9fe0ec',
    }
)
hi(
    0,
    'lualine_b_5_normal',
    {
        bg = '#26233a',
        bold = true,
        ctermbg = 237,
        ctermfg = 181,
        fg = '#edcbca',
    }
)
hi(
    0,
    'lualine_b_5_replace',
    { bg = '#26233a', bold = true, ctermbg = 237, ctermfg = 67, fg = '#3b819d' }
)
hi(
    0,
    'lualine_b_5_terminal',
    {
        bg = '#26233a',
        bold = true,
        ctermbg = 237,
        ctermfg = 181,
        fg = '#edcbca',
    }
)
hi(
    0,
    'lualine_b_5_visual',
    {
        bg = '#26233a',
        bold = true,
        ctermbg = 237,
        ctermfg = 146,
        fg = '#d1b7ec',
    }
)
hi(
    0,
    'lualine_b_command',
    { bg = '#26233a', ctermbg = 237, ctermfg = 174, fg = '#d36a87' }
)
hi(
    0,
    'lualine_b_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 242, fg = '#62616a' }
)
hi(
    0,
    'lualine_b_insert',
    { bg = '#26233a', ctermbg = 237, ctermfg = 251, fg = '#9bbec5' }
)
hi(
    0,
    'lualine_b_normal',
    { bg = '#26233a', ctermbg = 237, ctermfg = 181, fg = '#d6b1af' }
)
hi(
    0,
    'lualine_b_replace',
    { bg = '#26233a', ctermbg = 237, ctermfg = 67, fg = '#2f667d' }
)
hi(
    0,
    'lualine_b_visual',
    { bg = '#26233a', ctermbg = 237, ctermfg = 146, fg = '#b49dd1' }
)
hi(0, 'lualine_c_11_command', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_11_inactive', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_11_insert', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_11_normal', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_11_replace', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_11_terminal', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_11_visual', { bg = '#191724', fg = '#8fae66' })
hi(
    0,
    'lualine_c_14_command',
    { bg = '#242328', ctermbg = 235, ctermfg = 144, fg = '#769256' }
)
hi(
    0,
    'lualine_c_14_inactive',
    { bg = '#242328', ctermbg = 235, ctermfg = 144, fg = '#769256' }
)
hi(
    0,
    'lualine_c_14_insert',
    { bg = '#242328', ctermbg = 235, ctermfg = 144, fg = '#769256' }
)
hi(
    0,
    'lualine_c_14_normal',
    { bg = '#242328', ctermbg = 235, ctermfg = 144, fg = '#769256' }
)
hi(
    0,
    'lualine_c_14_replace',
    { bg = '#242328', ctermbg = 235, ctermfg = 144, fg = '#769256' }
)
hi(
    0,
    'lualine_c_14_terminal',
    { bg = '#242328', ctermbg = 235, ctermfg = 144, fg = '#769256' }
)
hi(
    0,
    'lualine_c_14_visual',
    { bg = '#242328', ctermbg = 235, ctermfg = 144, fg = '#769256' }
)
hi(0, 'lualine_c_15_command', { bg = '#191724', fg = '#a4cd6c' })
hi(0, 'lualine_c_15_inactive', { bg = '#191724', fg = '#a4cd6c' })
hi(0, 'lualine_c_15_insert', { bg = '#191724', fg = '#a4cd6c' })
hi(0, 'lualine_c_15_normal', { bg = '#191724', fg = '#a4cd6c' })
hi(0, 'lualine_c_15_replace', { bg = '#191724', fg = '#a4cd6c' })
hi(0, 'lualine_c_15_terminal', { bg = '#191724', fg = '#a4cd6c' })
hi(0, 'lualine_c_15_visual', { bg = '#191724', fg = '#a4cd6c' })
hi(0, 'lualine_c_21_command', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_21_inactive', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_21_insert', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_21_normal', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_21_replace', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_21_terminal', { bg = '#191724', fg = '#8fae66' })
hi(0, 'lualine_c_21_visual', { bg = '#191724', fg = '#8fae66' })
hi(
    0,
    'lualine_c_4_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#a4cd6c' }
)
hi(
    0,
    'lualine_c_4_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#a4cd6c' }
)
hi(
    0,
    'lualine_c_4_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#a4cd6c' }
)
hi(
    0,
    'lualine_c_4_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#a4cd6c' }
)
hi(
    0,
    'lualine_c_4_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#a4cd6c' }
)
hi(
    0,
    'lualine_c_4_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#a4cd6c' }
)
hi(
    0,
    'lualine_c_4_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#a4cd6c' }
)
hi(
    0,
    'lualine_c_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 254, fg = '#d2d1e2' }
)
hi(
    0,
    'lualine_c_diff_added_0_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_0_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_0_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_0_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_0_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_0_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_0_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_added_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 144, fg = '#8fae66' }
)
hi(
    0,
    'lualine_c_diff_modified_0_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_0_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_0_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_0_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_0_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_0_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_0_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_modified_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 180, fg = '#d8b27c' }
)
hi(
    0,
    'lualine_c_diff_removed_0_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_0_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_0_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_0_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_0_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_0_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_0_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_diff_removed_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 167, fg = '#d35b60' }
)
hi(
    0,
    'lualine_c_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 242, fg = '#62616a' }
)
hi(
    0,
    'lualine_c_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 254, fg = '#d2d1e2' }
)
hi(
    0,
    'lualine_c_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 254, fg = '#d2d1e2' }
)
hi(
    0,
    'lualine_c_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 254, fg = '#d2d1e2' }
)
hi(
    0,
    'lualine_c_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 254, fg = '#d2d1e2' }
)
hi(
    0,
    'lualine_transitional_lualine_a_13_command_to_lualine_b_12_command',
    { bg = '#26233a', fg = '#d36a87' }
)
hi(
    0,
    'lualine_transitional_lualine_a_13_insert_to_lualine_b_12_insert',
    { bg = '#26233a', fg = '#9bbec5' }
)
hi(
    0,
    'lualine_transitional_lualine_a_13_normal_to_lualine_b_12_normal',
    { bg = '#26233a', fg = '#d6b1af' }
)
hi(
    0,
    'lualine_transitional_lualine_a_13_normal_to_lualine_c_normal',
    { bg = '#191724', fg = '#d6b1af' }
)
hi(
    0,
    'lualine_transitional_lualine_a_13_terminal_to_lualine_b_12_terminal',
    { bg = '#26233a', fg = '#d6b1af' }
)
hi(
    0,
    'lualine_transitional_lualine_a_13_terminal_to_lualine_c_normal',
    { bg = '#191724', fg = '#d6b1af' }
)
hi(
    0,
    'lualine_transitional_lualine_a_6_command_to_lualine_b_5_command',
    { bg = '#26233a', ctermbg = 237, ctermfg = 174, fg = '#e883a1' }
)
hi(
    0,
    'lualine_transitional_lualine_a_6_insert_to_lualine_b_5_insert',
    { bg = '#26233a', fg = '#71a6b0' }
)
hi(
    0,
    'lualine_transitional_lualine_a_6_insert_to_lualine_c_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#9fe0ec' }
)
hi(
    0,
    'lualine_transitional_lualine_a_6_normal_to_lualine_b_5_normal',
    { bg = '#26233a', ctermbg = 237, ctermfg = 181, fg = '#edcbca' }
)
hi(
    0,
    'lualine_transitional_lualine_a_6_normal_to_lualine_c_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 181, fg = '#edcbca' }
)
hi(
    0,
    'lualine_transitional_lualine_a_6_terminal_to_lualine_b_5_terminal',
    { bg = '#26233a', fg = '#edcbca' }
)
hi(
    0,
    'lualine_transitional_lualine_a_6_terminal_to_lualine_c_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 181, fg = '#edcbca' }
)
hi(
    0,
    'lualine_transitional_lualine_a_6_visual_to_lualine_b_5_visual',
    { bg = '#26233a', fg = '#d1b7ec' }
)
hi(
    0,
    'lualine_transitional_lualine_b_12_command_to_lualine_c_command',
    { bg = '#191724', fg = '#1a1926' }
)
hi(
    0,
    'lualine_transitional_lualine_b_12_insert_to_lualine_c_insert',
    { bg = '#191724', fg = '#1a1926' }
)
hi(
    0,
    'lualine_transitional_lualine_b_12_normal_to_lualine_c_normal',
    { bg = '#191724', fg = '#1a1926' }
)
hi(
    0,
    'lualine_transitional_lualine_b_12_terminal_to_lualine_c_normal',
    { bg = '#191724', fg = '#1a1926' }
)
hi(
    0,
    'lualine_transitional_lualine_b_5_command_to_lualine_c_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 237, fg = '#312e47' }
)
hi(
    0,
    'lualine_transitional_lualine_b_5_insert_to_lualine_c_insert',
    { bg = '#191724', fg = '#080808' }
)
hi(
    0,
    'lualine_transitional_lualine_b_5_normal_to_lualine_c_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 237, fg = '#312e47' }
)
hi(
    0,
    'lualine_transitional_lualine_b_5_terminal_to_lualine_c_normal',
    { bg = '#191724', fg = '#312e47' }
)
hi(
    0,
    'lualine_transitional_lualine_b_5_visual_to_lualine_c_visual',
    { bg = '#191724', fg = '#312e47' }
)
hi(
    0,
    'lualine_transitional_lualine_b_command_to_lualine_c_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 237, fg = '#1a1926' }
)
hi(
    0,
    'lualine_transitional_lualine_b_insert_to_lualine_c_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 237, fg = '#1a1926' }
)
hi(
    0,
    'lualine_transitional_lualine_b_normal_to_lualine_c_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 237, fg = '#1a1926' }
)
hi(
    0,
    'lualine_transitional_lualine_b_visual_to_lualine_c_visual',
    { bg = '#191724', fg = '#312e47' }
)
hi(
    0,
    'lualine_transitional_lualine_z_progress_command_to_lualine_b_command',
    { bg = '#26233a', ctermbg = 237, ctermfg = 174, fg = '#d36a87' }
)
hi(
    0,
    'lualine_transitional_lualine_z_progress_insert_to_lualine_b_insert',
    { bg = '#26233a', ctermbg = 237, ctermfg = 251, fg = '#9bbec5' }
)
hi(
    0,
    'lualine_transitional_lualine_z_progress_normal_to_lualine_b_normal',
    { bg = '#26233a', ctermbg = 237, ctermfg = 181, fg = '#d6b1af' }
)
hi(
    0,
    'lualine_transitional_lualine_z_progress_terminal_to_lualine_b_normal',
    { bg = '#26233a', ctermbg = 237, ctermfg = 181, fg = '#d6b1af' }
)
hi(
    0,
    'lualine_transitional_lualine_z_progress_visual_to_lualine_b_visual',
    { bg = '#26233a', fg = '#d1b7ec' }
)
hi(0, 'lualine_x_15_command', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_15_inactive', { bg = '#191724', bold = true, fg = '#62616a' })
hi(0, 'lualine_x_15_insert', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_15_normal', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_15_replace', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_15_terminal', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_15_visual', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(
    0,
    'lualine_x_18_command',
    {
        bg = '#242328',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#b5b4ca',
    }
)
hi(
    0,
    'lualine_x_18_inactive',
    {
        bg = '#242328',
        bold = true,
        ctermbg = 235,
        ctermfg = 242,
        fg = '#494949',
    }
)
hi(
    0,
    'lualine_x_18_insert',
    {
        bg = '#242328',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#b5b4ca',
    }
)
hi(
    0,
    'lualine_x_18_normal',
    {
        bg = '#242328',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#b5b4ca',
    }
)
hi(
    0,
    'lualine_x_18_replace',
    {
        bg = '#242328',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#b5b4ca',
    }
)
hi(
    0,
    'lualine_x_18_terminal',
    {
        bg = '#242328',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#b5b4ca',
    }
)
hi(
    0,
    'lualine_x_18_visual',
    {
        bg = '#242328',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#b5b4ca',
    }
)
hi(0, 'lualine_x_19_command', { bg = '#191724', bold = true, fg = '#efeff1' })
hi(0, 'lualine_x_19_inactive', { bg = '#191724', bold = true, fg = '#7b759e' })
hi(0, 'lualine_x_19_insert', { bg = '#191724', bold = true, fg = '#efeff1' })
hi(0, 'lualine_x_19_normal', { bg = '#191724', bold = true, fg = '#efeff1' })
hi(0, 'lualine_x_19_replace', { bg = '#191724', bold = true, fg = '#efeff1' })
hi(0, 'lualine_x_19_terminal', { bg = '#191724', bold = true, fg = '#efeff1' })
hi(0, 'lualine_x_19_visual', { bg = '#191724', bold = true, fg = '#efeff1' })
hi(0, 'lualine_x_3_command', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_3_inactive', { bg = '#191724', bold = true, fg = '#62616a' })
hi(0, 'lualine_x_3_insert', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_3_normal', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_3_replace', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_3_terminal', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(0, 'lualine_x_3_visual', { bg = '#191724', bold = true, fg = '#d2d1e2' })
hi(
    0,
    'lualine_x_8_command',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#efeff1',
    }
)
hi(
    0,
    'lualine_x_8_inactive',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 242,
        fg = '#7b759e',
    }
)
hi(
    0,
    'lualine_x_8_insert',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#efeff1',
    }
)
hi(
    0,
    'lualine_x_8_normal',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#efeff1',
    }
)
hi(
    0,
    'lualine_x_8_replace',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#efeff1',
    }
)
hi(
    0,
    'lualine_x_8_terminal',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#efeff1',
    }
)
hi(
    0,
    'lualine_x_8_visual',
    {
        bg = '#191724',
        bold = true,
        ctermbg = 235,
        ctermfg = 254,
        fg = '#efeff1',
    }
)
hi(0, 'lualine_x_copilot_disabled_command', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_disabled_inactive', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_disabled_insert', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_disabled_normal', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_disabled_replace', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_disabled_terminal', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_disabled_visual', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_enabled_command', { bg = '#191724', fg = '#5ae779' })
hi(0, 'lualine_x_copilot_enabled_inactive', { bg = '#191724', fg = '#5ae779' })
hi(0, 'lualine_x_copilot_enabled_insert', { bg = '#191724', fg = '#5ae779' })
hi(0, 'lualine_x_copilot_enabled_normal', { bg = '#191724', fg = '#5ae779' })
hi(0, 'lualine_x_copilot_enabled_replace', { bg = '#191724', fg = '#5ae779' })
hi(0, 'lualine_x_copilot_enabled_terminal', { bg = '#191724', fg = '#5ae779' })
hi(0, 'lualine_x_copilot_enabled_visual', { bg = '#191724', fg = '#5ae779' })
hi(0, 'lualine_x_copilot_offline_command', { bg = '#191724', fg = '#ebac6a' })
hi(0, 'lualine_x_copilot_offline_inactive', { bg = '#191724', fg = '#ebac6a' })
hi(0, 'lualine_x_copilot_offline_insert', { bg = '#191724', fg = '#ebac6a' })
hi(0, 'lualine_x_copilot_offline_normal', { bg = '#191724', fg = '#ebac6a' })
hi(0, 'lualine_x_copilot_offline_replace', { bg = '#191724', fg = '#ebac6a' })
hi(0, 'lualine_x_copilot_offline_terminal', { bg = '#191724', fg = '#ebac6a' })
hi(0, 'lualine_x_copilot_offline_visual', { bg = '#191724', fg = '#ebac6a' })
hi(0, 'lualine_x_copilot_sleep_command', { bg = '#191724', fg = '#a4a9ba' })
hi(0, 'lualine_x_copilot_sleep_inactive', { bg = '#191724', fg = '#a4a9ba' })
hi(0, 'lualine_x_copilot_sleep_insert', { bg = '#191724', fg = '#a4a9ba' })
hi(0, 'lualine_x_copilot_sleep_normal', { bg = '#191724', fg = '#a4a9ba' })
hi(0, 'lualine_x_copilot_sleep_replace', { bg = '#191724', fg = '#a4a9ba' })
hi(0, 'lualine_x_copilot_sleep_terminal', { bg = '#191724', fg = '#a4a9ba' })
hi(0, 'lualine_x_copilot_sleep_visual', { bg = '#191724', fg = '#a4a9ba' })
hi(0, 'lualine_x_copilot_spinner_command', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_spinner_inactive', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_spinner_insert', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_spinner_normal', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_spinner_replace', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_spinner_terminal', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_spinner_visual', { bg = '#191724', fg = '#5c6689' })
hi(0, 'lualine_x_copilot_unknown_command', { bg = '#191724', fg = '#e65250' })
hi(0, 'lualine_x_copilot_unknown_inactive', { bg = '#191724', fg = '#e65250' })
hi(0, 'lualine_x_copilot_unknown_insert', { bg = '#191724', fg = '#e65250' })
hi(0, 'lualine_x_copilot_unknown_normal', { bg = '#191724', fg = '#e65250' })
hi(0, 'lualine_x_copilot_unknown_replace', { bg = '#191724', fg = '#e65250' })
hi(0, 'lualine_x_copilot_unknown_terminal', { bg = '#191724', fg = '#e65250' })
hi(0, 'lualine_x_copilot_unknown_visual', { bg = '#191724', fg = '#e65250' })
hi(
    0,
    'lualine_x_diagnostics_error_0_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_0_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_0_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_0_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_0_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_0_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_0_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_error_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 174, fg = '#b0556e' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_0_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_0_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_0_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_0_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_0_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_0_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_0_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_hint_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 146, fg = '#9b80b6' }
)
hi(
    0,
    'lualine_x_diagnostics_info_0_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_0_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_0_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_0_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_0_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_0_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_0_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_info_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 251, fg = '#87a3a7' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_0_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_0_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_0_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_0_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_0_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_0_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_0_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_diagnostics_warn_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 216, fg = '#c39b62' }
)
hi(
    0,
    'lualine_x_filetype_DevIconDefault_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 244, fg = '#677175' }
)
hi(
    0,
    'lualine_x_filetype_DevIconDefault_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 244, fg = '#677175' }
)
hi(
    0,
    'lualine_x_filetype_DevIconDefault_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 244, fg = '#677175' }
)
hi(
    0,
    'lualine_x_filetype_DevIconDefault_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 244, fg = '#677175' }
)
hi(
    0,
    'lualine_x_filetype_DevIconDefault_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 244, fg = '#677175' }
)
hi(
    0,
    'lualine_x_filetype_DevIconDefault_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 244, fg = '#677175' }
)
hi(
    0,
    'lualine_x_filetype_DevIconDefault_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 244, fg = '#677175' }
)
hi(
    0,
    'lualine_x_filetype_DevIconLua_command',
    { bg = '#191724', ctermbg = 235, ctermfg = 74, fg = '#57aee2' }
)
hi(
    0,
    'lualine_x_filetype_DevIconLua_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 74, fg = '#57aee2' }
)
hi(
    0,
    'lualine_x_filetype_DevIconLua_insert',
    { bg = '#191724', ctermbg = 235, ctermfg = 74, fg = '#57aee2' }
)
hi(
    0,
    'lualine_x_filetype_DevIconLua_normal',
    { bg = '#191724', ctermbg = 235, ctermfg = 74, fg = '#57aee2' }
)
hi(
    0,
    'lualine_x_filetype_DevIconLua_replace',
    { bg = '#191724', ctermbg = 235, ctermfg = 74, fg = '#57aee2' }
)
hi(
    0,
    'lualine_x_filetype_DevIconLua_terminal',
    { bg = '#191724', ctermbg = 235, ctermfg = 74, fg = '#57aee2' }
)
hi(
    0,
    'lualine_x_filetype_DevIconLua_visual',
    { bg = '#191724', ctermbg = 235, ctermfg = 74, fg = '#57aee2' }
)
hi(
    0,
    'lualine_x_filetype_DevIconMd_command',
    { bg = '#191724', fg = '#b3b3b3' }
)
hi(
    0,
    'lualine_x_filetype_DevIconMd_inactive',
    { bg = '#191724', fg = '#b3b3b3' }
)
hi(0, 'lualine_x_filetype_DevIconMd_insert', { bg = '#191724', fg = '#b3b3b3' })
hi(0, 'lualine_x_filetype_DevIconMd_normal', { bg = '#191724', fg = '#b3b3b3' })
hi(
    0,
    'lualine_x_filetype_DevIconMd_replace',
    { bg = '#191724', fg = '#b3b3b3' }
)
hi(
    0,
    'lualine_x_filetype_DevIconMd_terminal',
    { bg = '#191724', fg = '#b3b3b3' }
)
hi(0, 'lualine_x_filetype_DevIconMd_visual', { bg = '#191724', fg = '#b3b3b3' })
hi(
    0,
    'lualine_x_filetype_DevIconTypeScript_command',
    { bg = '#191724', fg = '#508ca6' }
)
hi(
    0,
    'lualine_x_filetype_DevIconTypeScript_inactive',
    { bg = '#191724', fg = '#508ca6' }
)
hi(
    0,
    'lualine_x_filetype_DevIconTypeScript_insert',
    { bg = '#191724', fg = '#508ca6' }
)
hi(
    0,
    'lualine_x_filetype_DevIconTypeScript_normal',
    { bg = '#191724', fg = '#508ca6' }
)
hi(
    0,
    'lualine_x_filetype_DevIconTypeScript_replace',
    { bg = '#191724', fg = '#508ca6' }
)
hi(
    0,
    'lualine_x_filetype_DevIconTypeScript_terminal',
    { bg = '#191724', fg = '#508ca6' }
)
hi(
    0,
    'lualine_x_filetype_DevIconTypeScript_visual',
    { bg = '#191724', fg = '#508ca6' }
)
hi(
    0,
    'lualine_z_progress_0_command',
    { bg = '#eb6f92', ctermbg = 174, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_0_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 242, fg = '#62616a' }
)
hi(
    0,
    'lualine_z_progress_0_insert',
    { bg = '#9ccfd8', ctermbg = 251, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_0_normal',
    { bg = '#ebbcba', ctermbg = 181, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_0_replace',
    { bg = '#31748f', ctermbg = 67, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_0_terminal',
    { bg = '#ebbcba', ctermbg = 181, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_0_visual',
    { bg = '#c4a7e7', ctermbg = 146, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_command',
    { bg = '#eb6f92', ctermbg = 174, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_inactive',
    { bg = '#191724', ctermbg = 235, ctermfg = 242, fg = '#62616a' }
)
hi(
    0,
    'lualine_z_progress_insert',
    { bg = '#9ccfd8', ctermbg = 251, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_normal',
    { bg = '#ebbcba', ctermbg = 181, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_replace',
    { bg = '#31748f', ctermbg = 67, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_terminal',
    { bg = '#ebbcba', ctermbg = 181, ctermfg = 235, fg = '#0c0b11' }
)
hi(
    0,
    'lualine_z_progress_visual',
    { bg = '#c4a7e7', ctermbg = 146, ctermfg = 235, fg = '#0c0b11' }
)
hi(0, 'markdownDelimiter', { ctermfg = 246, fg = '#686873' })
hi(0, 'markdownH1', { bold = true, ctermfg = 146, fg = '#9b80b6' })
hi(0, 'markdownH1Delimiter', { link = 'markdownH1' })
hi(0, 'markdownH2', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'markdownH2Delimiter', { link = 'markdownH2' })
hi(0, 'markdownH3', { bold = true, ctermfg = 181, fg = '#b67875' })
hi(0, 'markdownH3Delimiter', { link = 'markdownH3' })
hi(0, 'markdownH4', { bold = true, ctermfg = 216, fg = '#c39b62' })
hi(0, 'markdownH4Delimiter', { link = 'markdownH4' })
hi(0, 'markdownH5', { bold = true, ctermfg = 67, fg = '#2c667e' })
hi(0, 'markdownH5Delimiter', { link = 'markdownH5' })
hi(0, 'markdownH6', { bold = true, ctermfg = 251, fg = '#87a3a7' })
hi(0, 'markdownH6Delimiter', { link = 'markdownH6' })
hi(0, 'markdownLinkText', { link = 'markdownUrl' })
hi(
    0,
    'markdownUrl',
    { ctermfg = 146, fg = '#9b80b6', sp = '#c4a7e7', underline = true }
)
hi(0, 'mkdCode', { ctermfg = 251, fg = '#87a3a7', italic = true })
hi(0, 'mkdCodeDelimiter', { ctermfg = 181, fg = '#b67875' })
hi(0, 'mkdCodeEnd', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'mkdCodeStart', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'mkdFootnotes', { ctermfg = 251, fg = '#87a3a7' })
hi(0, 'mkdID', { ctermfg = 251, fg = '#87a3a7', underline = true })
hi(0, 'mkdInlineURL', { link = 'markdownUrl' })
hi(0, 'mkdLink', { link = 'markdownUrl' })
hi(0, 'mkdLinkDef', { link = 'markdownUrl' })
hi(0, 'mkdListItemLine', { ctermfg = 254, fg = '#b5b4ca' })
hi(0, 'mkdRule', { ctermfg = 246, fg = '#686873' })
hi(0, 'mkdURL', { link = 'markdownUrl' })
hi(0, 'nvim-highlight-colors-171717', { bg = '#171717', fg = '#f1f1f1' })
hi(0, 'nvim-highlight-colors-39364a', { bg = '#39364a', fg = '#f1f1f1' })
hi(0, 'nvim-highlight-colors-3f3c52', { bg = '#3f3c52', fg = '#f1f1f1' })
hi(0, 'nvim-highlight-colors-eeeeee', { bg = '#eeeeee', fg = '#080808' })

-- Terminal colors
local g = vim.g

g.terminal_color_0 = '#171717'
g.terminal_color_1 = '#a16f6c'
g.terminal_color_2 = '#65882e'
g.terminal_color_3 = '#b48e5a'
g.terminal_color_4 = '#a9a8b5'
g.terminal_color_5 = '#8a77a0'
g.terminal_color_6 = '#7d9498'
g.terminal_color_7 = '#a9a8b5'
g.terminal_color_8 = '#171717'
g.terminal_color_9 = '#a16f6c'
g.terminal_color_10 = '#65882e'
g.terminal_color_11 = '#b48e5a'
g.terminal_color_12 = '#a9a8b5'
g.terminal_color_13 = '#8a77a0'
g.terminal_color_14 = '#7d9498'
g.terminal_color_15 = '#a9a8b5'
