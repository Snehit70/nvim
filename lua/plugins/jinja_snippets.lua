local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

-- Add snippets for jinja2 filetype
-- Also add snippets for HTML files that might contain Jinja templates
ls.add_snippets("jinja2", {
    -- Variable output
    s("var", {
        t("{{ "), i(1, "variable"), t(" }}")
    }),
    
    -- For loop
    s("for", {
        t("{% for "), i(1, "item"), t(" in "), i(2, "items"), t(" %}"),
        t({"", "    "}), i(3, "content"),
        t({"", "{% endfor %}"})
    }),
    
    -- If statement
    s("if", {
        t("{% if "), i(1, "condition"), t(" %}"),
        t({"", "    "}), i(2, "content"),
        t({"", "{% endif %}"})
    }),
    
    -- If-else statement
    s("ifelse", {
        t("{% if "), i(1, "condition"), t(" %}"),
        t({"", "    "}), i(2, "if_content"),
        t({"", "{% else %}"}),
        t({"", "    "}), i(3, "else_content"),
        t({"", "{% endif %}"})
    }),
    
    -- Block
    s("block", {
        t("{% block "), i(1, "name"), t(" %}"),
        t({"", "    "}), i(2, "content"),
        t({"", "{% endblock %}"})
    }),
    
    -- Extends
    s("extends", {
        t("{% extends \""), i(1, "base.html"), t("\" %}")
    }),
    
    -- Include
    s("include", {
        t("{% include \""), i(1, "template.html"), t("\" %}")
    }),
    
    -- Comment
    s("comment", {
        t("{# "), i(1, "comment"), t(" #}")
    }),
    
    -- Set variable
    s("set", {
        t("{% set "), i(1, "variable"), t(" = "), i(2, "value"), t(" %}")
    }),
    
    -- Macro
    s("macro", {
        t("{% macro "), i(1, "name"), t("("), i(2, "args"), t(") %}"),
        t({"", "    "}), i(3, "content"),
        t({"", "{% endmacro %}"})
    }),
})

-- Also add snippets for html files that might contain jinja
ls.add_snippets("html", {
    s("jvar", {
        t("{{ "), i(1, "variable"), t(" }}")
    }),
    s("jfor", {
        t("{% for "), i(1, "item"), t(" in "), i(2, "items"), t(" %}"),
        t({"", "    "}), i(3, "content"),
        t({"", "{% endfor %}"})
    }),
    s("jif", {
        t("{% if "), i(1, "condition"), t(" %}"),
        t({"", "    "}), i(2, "content"),
        t({"", "{% endif %}"})
    }),
})
