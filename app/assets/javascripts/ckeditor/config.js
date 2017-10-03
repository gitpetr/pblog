CKEDITOR.editorConfig = function (config) {
    // ... other configuration ...
    config.language = 'ru';
    config.height = '1200px';
    config.toolbar_mini = [
        ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
    ];
    config.toolbar = "mini";

    // ... rest of the original config.js  ...
}
