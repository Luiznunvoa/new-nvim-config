local lint = require("lint")

require("lint").try_lint()

-- INFO: SQL linter (sqlfluff)

lint.linters.sqlfluff = {
  cmd = "sqlfluff",
  stdin = false,
  args = {
    "lint",
    "--config", vim.fn.getcwd() .. "/.sqlfluff",
    "--format", "json",
  },
  stream = "stdout",
  ignore_exitcode = true,
  parser = function(output, bufnr)
    local ok, decoded = pcall(vim.json.decode, output)
    if not ok or type(decoded) ~= "table" then
      return {}
    end

    local diagnostics = {}
    for _, file in ipairs(decoded) do
      for _, v in ipairs(file.violations or {}) do
        table.insert(diagnostics, {
          lnum = v.start_line_no - 1,
          col = v.start_line_pos - 1,
          end_lnum = v.end_line_no - 1,
          end_col = v.end_line_pos - 1,
          source = "sqlfluff",
          message = v.description or "sqlfluff violation",
          severity = v.warning and vim.diagnostic.severity.WARN or vim.diagnostic.severity.ERROR,
        })
      end
    end
    return diagnostics
  end
}

lint.linters_by_ft = {
  python = {},
  typescript = {},
  sql = { "sqlfluff" },
  ["jinja.sql"] = { "sqlfluff" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
