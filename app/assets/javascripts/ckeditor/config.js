CKEDITOR.editorConfig = function (config) {
  config.language = 'fr';
  config.toolbarGroups = [
    { name: 'clipboard', groups: ['clipboard', 'undo'] },
    { name: 'document', groups: ['mode', 'document', 'doctools'] },
    { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
    { name: 'forms', groups: ['forms'] },
    { name: 'insert', groups: ['insert'] },
    '/',
    { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
    { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
    { name: 'links', groups: ['links'] },
    '/',
    { name: 'styles', groups: ['styles'] },
    { name: 'colors', groups: ['colors'] },
    { name: 'tools', groups: ['tools'] },
    { name: 'others', groups: ['others'] },
    { name: 'about', groups: ['about'] }
  ];

  config.removeButtons = 'Source,Save,NewPage,Print,Cut,Copy,Paste,PasteText,PasteFromWord,ImageButton,HiddenField,Flash,PageBreak,Iframe,BGColor,SelectAll,Textarea,Button,TextField,Radio,Checkbox,Form,Select,Language,Image';
};
