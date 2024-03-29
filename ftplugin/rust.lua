local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  c = {
    name = "+Rust [C]rates",
    o = { "<cmd>lua require('crates').show_popup()<CR>", "Show popup" },
    r = { "<cmd>lua require('crates').reload()<CR>", "Reload" },
    v = { "<cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions" },
    f = { "<cmd>lua require('crates').show_features_popup()<CR>", "Show Features" },
    d = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies Popup" },
    u = { "<cmd>lua require('crates').update_crate()<CR>", "Update Crate" },
    a = { "<cmd>lua require('crates').update_all_crates()<CR>", "Update All Crates" },
    U = { "<cmd>lua require('crates').upgrade_crate<CR>", "Upgrade Crate" },
    A = { "<cmd>lua require('crates').upgrade_all_crates(true)<CR>", "Upgrade All Crates" },
    H = { "<cmd>lua require('crates').open_homepage()<CR>", "Open Homepage" },
    R = { "<cmd>lua require('crates').open_repository()<CR>", "Open Repository" },
    D = { "<cmd>lua require('crates').open_documentation()<CR>", "Open Documentation" },
    C = { "<cmd>lua require('crates').open_crates_io()<CR>", "Open Crate.io" },
  },
  l = {
    name = "+[L]SP",
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
    o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
    R = { "<cmd>Telescope lsp_references<cr>", "References" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display Signature Information" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename all references" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    l = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
    L = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
  },
  r = {
    name = "+[R]ust",
    s = { "<cmd>InspectTree <CR>", "View Syntax Tree" },
    e = { "<cmd>RustLsp explainError <CR>", "Explain errors" },
    r = { "<cmd>RustLsp ssr <CR>", "Structural Search Replace" },
    h = { "<cmd>RustLsp view hir <CR>", "View HIR" },
    m = { "<cmd>RustLsp view mir <CR>", "View MIR" },
    a = { "<cmd>RustLsp codeAction <CR>", "Show Rust code action" },
    c = { "<cmd>RustLsp openCargo <CR>", "Open Cargo.toml" },
    i = { "<cmd>lua require('ferris.methods.view_item_tree')<CR>", "View Item Tree" },
    M = { "<cmd>lua require('ferris.methods.view_memory_layout')<CR>", "View Memory Layout" },
    f = { "<cmd>Lspsaga finder <CR>", "Show LSP methods search result" },
  }
}

which_key.register(mappings, opts)

vim.keymap.set("n", "A", "<cmd>RustLsp hover actions<CR>", { silent = true, desc = "Rust Hover" })
vim.keymap.set("n", "gl", "<cmd>RustLsp explainError<CR>", { silent = true, desc = "Explain error" })

