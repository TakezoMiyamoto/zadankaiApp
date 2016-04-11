CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];

  config.toolbar = [
  ['Source','Preview']
  ,['Cut','Copy','Paste','PasteText','Undo','Redo']
  ,['Styles','Format','Font','FontSize']
  ,['TextColor','BGColor','RemoveFormat','Maximize']
  ,'/'
  ,['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']
  ,['NumberedList','BulletedList','Blockquote']
  ,['Link','Unlink','Anchor','Image','HorizontalRule','Smiley']
];



  // ... rest of the original config.js  ...
}