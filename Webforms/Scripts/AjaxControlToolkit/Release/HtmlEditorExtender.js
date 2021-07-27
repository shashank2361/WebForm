Type.registerNamespace("Sys.Extended.UI"),Sys.Extended.UI.HtmlEditorExtenderBehavior=function(e){Sys.Extended.UI.HtmlEditorExtenderBehavior.initializeBase(this,[e]),this._textbox=Sys.Extended.UI.TextBoxWrapper.get_Wrapper(e);var t=this.get_id();this._backColor=null,this._foreColor=null,this._commandName=null,this._savedRange=null,this._isInFocus=null,this._oldContents=null,this._newContents=null,this._isDirty=!1,this._lastMode=Sys.Extended.UI.HtmlEditorExtenderMode.Content,this._displaySourceTab=!1,this._displayPreviewTab=!1,this._ButtonWidth=23,this._ButtonHeight=21,this._containerTemplate={nodeName:"div",properties:{id:t+"_ExtenderContainer"},cssClasses:["unselectable","ajax__html_editor_extender_container"]},this._editableTemplate={nodeName:"div",properties:{id:t+"_ExtenderContentEditable",style:{overflow:"auto",clear:"both"},contentEditable:!0},cssClasses:["ajax__html_editor_extender_texteditor"]},this._sourceViewTemplate={nodeName:"div",properties:{id:t+"_ExtenderSourceView",style:{height:"90%",overflow:"auto",clear:"both"},contentEditable:!0},cssClasses:["ajax__html_editor_extender_texteditor"]},this._buttonTemplate={nodeName:"input",properties:{type:"button",style:{width:this._ButtonWidth+"px",height:this._ButtonHeight+"px"}},cssClasses:["ajax__html_editor_extender_button"]},this._buttonContentTemplate={nodeName:"input",properties:{type:"button",style:{width:this._ButtonWidth+"px",height:this._ButtonHeight+"px"}},cssClasses:["ajax__html_editor_extender_button ajax__html_editor_extender_content"]},this._buttonSourceTemplate={nodeName:"input",properties:{type:"button",style:{width:this._ButtonWidth+"px",height:this._ButtonHeight+"px"}},cssClasses:["ajax__html_editor_extender_button ajax__html_editor_extender_source"]},this._buttonPreviewTemplate={nodeName:"input",properties:{type:"button",style:{width:this._ButtonWidth+"px",height:this._ButtonHeight+"px"}},cssClasses:["ajax__html_editor_extender_button ajax__html_editor_extender_preview"]},this._textboxTemplate={nodeName:"input",properties:{type:"text"}},this._dropDownTemplate={nodeName:"select",properties:{style:{width:this._ButtonWidth+"px",height:this._ButtonHeight+"px"}},cssClasses:["ajax__html_editor_extender_button"]},this._topButtonContainerTemplate={nodeName:"div",properties:{id:t+"_ExtenderButtonContainer"},cssClasses:["ajax__html_editor_extender_buttoncontainer"]},this._bottomButtonsContainerTemplate={nodeName:"div",properties:{id:t+"_ExtenderModeButtonContainer",style:{clear:"both"}},cssClasses:["ajax__html_editor_extender_modebuttonscontainer"]},this._container=null,this._toolbarButtons=null,this._editableDiv=null,this._sourceViewDiv=null,this._previewDiv=null,this._topButtonContainer=null,this._bottomButtonsContainer=null,this._buttons=[],this._requested_buttons=new Array,this._colorPicker=null,this._txtBoxForColor=null,this._contentViewButton=null,this._sourceViewButton=null,this._previewButton=null,this._popupDiv=null,this._btnDone=null,this._btnCancel=null,this._isFocusInEditableDiv=!1,this._textBoxOnBlurDelegate=null,this._editableDivOnBlurDelegate=null,this._editableDivOnFocusDelegate=null,this._btnClickDelegate=null,this._contentViewClickDelegate=null,this._sourceViewClickDelegate=null,this._sourceViewDivOnBlurDelegate=null,this._previewClickDelegate=null,this._imageCancelClickDelegate=null,"function"!=typeof WebForm_OnSubmit||Sys.Extended.UI.HtmlEditorExtenderBehavior._originalWebForm_OnSubmit||(Sys.Extended.UI.HtmlEditorExtenderBehavior._originalWebForm_OnSubmit=WebForm_OnSubmit,WebForm_OnSubmit=Sys.Extended.UI.HtmlEditorExtenderBehavior.WebForm_OnSubmit)},Sys.Extended.UI.HtmlEditorExtenderBehavior.prototype={initialize:function(){Sys.Extended.UI.HtmlEditorExtenderBehavior.callBaseMethod(this,"initialize"),HtmlEditorExtender_editableDivs[HtmlEditorExtender_editableDivs.length]=this,this._button_list=new Array;var e=this._element===document.activeElement;this._createContainer(),this._createTopButtonContainer(),this._createButton(),this._createEditableDiv(),this.get_displaySourceTab()&&this._createSourceViewDiv(),this.get_displayPreviewTab()&&this._createPreviewDiv(),this._hasMultipleTabs()&&this._createBottomButtonsContainer();for(var t=this._textbox._element.parentNode;null!=t&&"FORM"!=t.nodeName;)t=t.parentNode;if(null==t)throw"Missing Form tag";var i=this.get_id();this._popupDiv=$get(i+"_popupDiv"),null==this._popupDiv&&(i=i.indexOf("_")!=-1?i.substring(i.lastIndexOf("_")+1):"",this._popupDiv=$get(i+"_popupDiv")),null!=this._popupDiv&&(this._popupBehavior=$create(Sys.Extended.UI.PopupBehavior,{id:i+"_ImagePopupBehavior",parentElement:this.get_element(),unselectable:"on"},null,null,this._popupDiv),this._btnCancel=$get(i+"_btnCancel"),this._imageCancelClickDelegate=Function.createDelegate(this,this._btnCancel_click),$addHandler(this._btnCancel,"click",this._imageCancelClickDelegate,!0),this._elementVisible(this._popupDiv,!1)),this._textBoxOnBlurDelegate=Function.createDelegate(this,this._textBox_onblur),this._editableDivOnBlurDelegate=Function.createDelegate(this,this._editableDiv_onblur),this._editableDivOnFocusDelegate=Function.createDelegate(this,this._editableDiv_onfocus),this._btnClickDelegate=Function.createDelegate(this,this._executeCommand),this.get_displaySourceTab()&&(this._sourceViewClickDelegate=Function.createDelegate(this,this._sourceView_click)),this.get_displayPreviewTab()&&(this._previewClickDelegate=Function.createDelegate(this,this._preview_click)),this._hasMultipleTabs()&&(this._contentViewClickDelegate=Function.createDelegate(this,this._contentView_click),this._sourceViewDivOnBlurDelegate=Function.createDelegate(this,this._sourceViewDiv_onblur)),$addHandler(this._textbox._element,"blur",this._textBoxOnBlurDelegate,!0),$addHandler(this._editableDiv,"blur",this._editableDivOnBlurDelegate,!0),$addHandler(this._editableDiv,"focus",this._editableDivOnFocusDelegate,!0),$addHandler(this._topButtonContainer,"click",this._btnClickDelegate,!0),this.get_displaySourceTab()&&$addHandler(this._sourceViewButton,"click",this._sourceViewClickDelegate,!0),this.get_displayPreviewTab()&&$addHandler(this._previewButton,"click",this._previewClickDelegate,!0),this._hasMultipleTabs()&&($addHandler(this._contentViewButton,"click",this._contentViewClickDelegate,!0),$addHandler(this._sourceViewDiv,"blur",this._sourceViewDivOnBlurDelegate,!0)),e&&this._editableDiv.focus()},_dispose:function(){$removeHandler(this._textbox._element,"blur",this._textBoxOnBlurDelegate),$removeHandler(this._editableDiv,"blur",this._editableDivOnBlurDelegate),$removeHandler(this._editableDiv,"focus",this._editableDivOnFocusDelegate),$removeHandler(this._topButtonContainer,"click",this._btnClickDelegate),this.get_displaySourceTab()&&$removeHandler(this._sourceViewButton,"click",this._sourceViewClickDelegate),this.get_displayPreviewTab()&&$removeHandler(this.previewButton,"click",this._previewClickDelegate),this._hasMultipleTabs()&&($removeHandler(this._contentViewButton,"click",this._contentViewClickDelegate),$removeHandler(this._sourceViewDiv,"blur",this._sourceViewDivOnBlurDelegate)),null!=this._popupDiv&&$removeHandler(this._btnCancel,"click",this._imageCancelClickDelegate),Sys.Extended.UI.HtmlEditorExtenderBehavior.callBaseMethod(this,"dispose")},_hasMultipleTabs:function(){return this.get_displaySourceTab()||this.get_displayPreviewTab()},_createContainer:function(){var e=this.get_element();this._container=$common.createElementFromTemplate(this._containerTemplate,e.parentNode),this._elementVisible(this._textbox._element,!0);var t=$common.getBounds(this._textbox._element);$common.setSize(this._container,{width:t.width,height:t.height}),this._elementVisible(this._textbox._element,!1),$common.wrapElement(this._textbox._element,this._container,this._container)},_createTopButtonContainer:function(){this._topButtonContainer=$common.createElementFromTemplate(this._topButtonContainerTemplate,this._container)},_createButton:function(){var e=this,t=Sys.Browser.agent==Sys.Browser.InternetExplorer;for(i=0;i<this._toolbarButtons.length;i++){var n;if("HorizontalSeparator"==this._toolbarButtons[i].CommandName)n=$common.createElementFromTemplate({nodeName:"span",cssClasses:["ajax__html_editor_extender_separator"]},this._topButtonContainer);else if("FontName"==this._toolbarButtons[i].CommandName){n=$common.createElementFromTemplate({nodeName:"nobr",properties:{style:{float:"left",cssFloat:"left",fontSize:"11px"}},cssClasses:["ajax__html_editor_extender_fontnameclass"],children:[{nodeName:"span",properties:{textContent:"Font ",innerText:"Font ",style:{paddingLeft:"5px",fontWeight:"bold"}}}]},this._topButtonContainer),_select=$common.createElementFromTemplate({nodeName:"select",properties:{style:{fontSize:"9px",fontFamily:"Arial",height:"20px",width:"90px"}},events:{change:function(t){var i=this.options[this.selectedIndex].value;setTimeout(function(){e.setFontFamily(i)},200)}}},n);var o=[{Text:"Arial",Value:"arial,helvetica,sans-serif"},{Text:"Courier New",Value:"courier new,courier,monospace"},{Text:"Georgia",Value:"georgia,times new roman,times,serif"},{Text:"Tahoma",Value:"tahoma,arial,helvetica,sans-serif"},{Text:"Times New Roman",Value:"times new roman,times,serif"},{Text:"Verdana",Value:"verdana,arial,helvetica,sans-serif"},{Text:"Impact",Value:"impact"},{Text:"WingDings",Value:"wingdings"}];for(x in o){var s=document.createElement("option");s.text=o[x].Text,s.value=o[x].Value;try{_select.add(s,null)}catch(e){_select.add(s)}}_select.setAttribute("id",this._id+this._toolbarButtons[i].CommandName),_select.setAttribute("name",this._toolbarButtons[i].CommandName),_select.setAttribute("title",this._toolbarButtons[i].Tooltip),_select.setAttribute("unselectable","on")}else if("FontSize"==this._toolbarButtons[i].CommandName){n=$common.createElementFromTemplate({nodeName:"nobr",properties:{style:{float:"left",cssFloat:"left",fontSize:"11px"}},cssClasses:["ajax__html_editor_extender_fontsizeclass"],children:[{nodeName:"span",properties:{textContent:"Size ",innerText:"Size ",style:{paddingLeft:"5px",fontWeight:"bold"}}}]},this._topButtonContainer),_select=$common.createElementFromTemplate({nodeName:"select",properties:{style:{fontSize:"11px",fontFamily:"Arial",height:"20px",width:t?"30px":"50px"}},events:{change:function(t){var i=this.options[this.selectedIndex].value;setTimeout(function(){e.setFontSize(i)},200)}}},n);var o=[{Text:"1",Value:"1"},{Text:"2",Value:"2"},{Text:"3",Value:"3"},{Text:"4",Value:"4"},{Text:"5",Value:"5"},{Text:"6",Value:"6"},{Text:"7",Value:"7"}];for(x in o){var s=document.createElement("option");s.text=o[x].Text,s.value=o[x].Value;try{_select.add(s,null)}catch(e){_select.add(s)}}_select.setAttribute("id",this._id+this._toolbarButtons[i].CommandName),_select.setAttribute("name",this._toolbarButtons[i].CommandName),_select.setAttribute("title",this._toolbarButtons[i].Tooltip),_select.setAttribute("unselectable","on")}else"ForeColor"==this._toolbarButtons[i].CommandName?(n=$common.createElementFromTemplate({nodeName:"span",properties:{style:{backgroundColor:"#ff0000",border:"solid 1px #c2c2c2",display:"block",float:"left",cssFloat:"left"}},cssClasses:["ajax__html_editor_extender_forecolorclass"]},this._topButtonContainer),n.setAttribute("unselectable","on"),this._foreColor=$common.createElementFromTemplate({nodeName:"input",properties:{type:"button",id:this._id+this._toolbarButtons[i].CommandName,name:this._toolbarButtons[i].CommandName,title:this._toolbarButtons[i].Tooltip,style:{backgroundColor:"transparent",width:"21px",height:"19px",color:"transparent"}},cssClasses:["ajax__html_editor_extender_button ajax__html_editor_extender_"+this._toolbarButtons[i].CommandName]},n),this._foreColor.setAttribute("unselectable","on")):"BackColor"==this._toolbarButtons[i].CommandName?(n=$common.createElementFromTemplate({nodeName:"span",properties:{style:{backgroundColor:"#ff0000",border:"solid 1px #c2c2c2",display:"block",float:"left",cssFloat:"left"}},cssClasses:["ajax__html_editor_extender_backcolorclass"]},this._topButtonContainer),n.setAttribute("unselectable","on"),this._backColor=$common.createElementFromTemplate({nodeName:"input",properties:{type:"button",id:this._id+this._toolbarButtons[i].CommandName,name:this._toolbarButtons[i].CommandName,title:this._toolbarButtons[i].Tooltip,style:{backgroundColor:"transparent",width:"21px",height:"19px",color:"transparent"}},cssClasses:["ajax__html_editor_extender_button ajax__html_editor_extender_"+this._toolbarButtons[i].CommandName]},n),this._backColor.setAttribute("unselectable","on")):(n=$common.createElementFromTemplate({nodeName:"input",properties:{type:"button",id:this._id+this._toolbarButtons[i].CommandName,name:this._toolbarButtons[i].CommandName,title:this._toolbarButtons[i].Tooltip,style:{width:"23px",height:"21px"}},cssClasses:["ajax__html_editor_extender_button ajax__html_editor_extender_"+this._toolbarButtons[i].CommandName]},this._topButtonContainer),n.setAttribute("unselectable","on"),Array.add(this._buttons,n))}},setFontFamily:function(e){this._executeStyleWithCssCommand(),document.execCommand("fontname",!1,e)},setFontSize:function(e){this._executeStyleWithCssCommand(),document.execCommand("fontsize",!1,e)},_executeStyleWithCssCommand:function(){var e="styleWithCSS",t=document.queryCommandSupported(e);t&&document.execCommand(e,!1,!0)},_createEditableDiv:function(){var e,t=this.get_id();this._elementVisible(this._container,!0),e=this.get_displaySourceTab()?this._container.clientHeight-(this._topButtonContainer.clientHeight+25):this._container.clientHeight-this._topButtonContainer.clientHeight,this._elementVisible(this._container,!1),this._editableDiv=$common.createElementFromTemplate({nodeName:"div",properties:{id:t+"_ExtenderContentEditable",style:{height:e+"px",overflow:"auto",clear:"both"},contentEditable:!0},cssClasses:["ajax__html_editor_extender_texteditor"]},this._container),this._textbox._element.value=this._textbox._element.value.replace(/&amp;/g,"&"),this._editableDiv.innerHTML=this._textbox._element.value,this._oldContents=this._editableDiv.innerHTML,$common.setVisible(this._textbox._element,!1)},_createBottomButtonsContainer:function(){this._bottomButtonsContainer=$common.createElementFromTemplate(this._bottomButtonsContainerTemplate,this._container),this._contentViewButton=$common.createElementFromTemplate(this._buttonContentTemplate,this._bottomButtonsContainer),this.get_displaySourceTab()&&(this._sourceViewButton=$common.createElementFromTemplate(this._buttonSourceTemplate,this._bottomButtonsContainer)),this.get_displayPreviewTab()&&(this._previewButton=$common.createElementFromTemplate(this._buttonPreviewTemplate,this._bottomButtonsContainer))},_createSourceViewDiv:function(){var e=this.get_id(),t=this._container.clientHeight-25;this._sourceViewDiv=$common.createElementFromTemplate({nodeName:"div",properties:{id:e+"_ExtenderSourceView",style:{height:t+"px",overflow:"auto",clear:"both"},contentEditable:!0},cssClasses:["ajax__html_editor_extender_texteditor"]},this._container),$common.setVisible(this._sourceViewDiv,!1)},_createPreviewDiv:function(){var e=this.get_id(),t=this._container.clientHeight-25;this._previewDiv=$common.createElementFromTemplate({nodeName:"div",properties:{id:e+"_ExtenderPreview",style:{height:t+"px",overflow:"auto",clear:"both"}},cssClasses:["ajax__html_editor_extender_texteditor"]},this._container),$common.setVisible(this._previewDiv,!1)},_editableDiv_onblur:function(){this._textbox._element.value=this._encodeHtml(),this._isFocusInEditableDiv=!1,this._oldContents!=this._editableDiv.innerHTML&&(this._isDirty=!0,this._oldContents=this._editableDiv.innerHTML,this._raiseEvent("change"))},_editableDiv_onfocus:function(){this._isFocusInEditableDiv=!1},_sourceViewDiv_onblur:function(){this._oldContents!=(this._sourceViewDiv.innerText||this._sourceViewDiv.textContent)&&(this._isDirty=!0,void 0!=this._sourceViewDiv.textContent?this._editableDiv.innerHTML=this._sourceViewDiv.textContent:this._editableDiv.innerHTML=this._sourceViewDiv.innerText,this._oldContents=this._editableDiv.innerHTML,this._raiseEvent("change"))},_textBox_onblur:function(){this._editableDiv.innerHTML=this._textbox._element.value},_contentView_click:function(){this._lastMode!==Sys.Extended.UI.HtmlEditorExtenderMode.Content&&($common.setVisible(this._topButtonContainer,!0),$common.setVisible(this._editableDiv,!0),void 0!=this._sourceViewDiv.textContent?this._editableDiv.innerHTML=this._sourceViewDiv.textContent:this._editableDiv.innerHTML=this._sourceViewDiv.innerText,this._oldContents=this._editableDiv.innerHTML,$common.setVisible(this._sourceViewDiv,!1),$common.setVisible(this._previewDiv,!1),this._lastMode=Sys.Extended.UI.HtmlEditorExtenderMode.Content)},_sourceView_click:function(){this._lastMode!==Sys.Extended.UI.HtmlEditorExtenderMode.Source&&($common.setVisible(this._sourceViewDiv,!0),this._copyContentToSource(),this._oldContents=this._editableDiv.innerHTML,$common.setVisible(this._editableDiv,!1),$common.setVisible(this._topButtonContainer,!1),$common.setVisible(this._previewDiv,!1),this._lastMode=Sys.Extended.UI.HtmlEditorExtenderMode.Source)},_preview_click:function(){this._lastMode!==Sys.Extended.UI.HtmlEditorExtenderMode.Preview&&($common.setVisible(this._previewDiv,!0),this._lastMode===Sys.Extended.UI.HtmlEditorExtenderMode.Content&&this._copyContentToSource(),this._lastMode===Sys.Extended.UI.HtmlEditorExtenderMode.Source&&(void 0!=this._sourceViewDiv.textContent?this._previewDiv.innerHTML=this._sourceViewDiv.textContent:this._previewDiv.innerHTML=this._sourceViewDiv.innerText),this._lastMode===Sys.Extended.UI.HtmlEditorExtenderMode.Content&&(this._previewDiv.innerHTML=this._editableDiv.innerHTML),$common.setVisible(this._editableDiv,!1),$common.setVisible(this._sourceViewDiv,!1),$common.setVisible(this._topButtonContainer,!1),this._lastMode=Sys.Extended.UI.HtmlEditorExtenderMode.Preview)},_copyContentToSource:function(){var e=this._editableDiv.innerHTML;/^\s*$/.test(this._editableDiv.innerText)&&"<br>"===this._editableDiv.innerHTML&&(e=""),void 0!=this._sourceViewDiv.textContent?this._sourceViewDiv.textContent=this.cleanHtml(e):this._sourceViewDiv.innerText=this.cleanHtml(e)},cleanHtml:function(e){return e.replace(/<br>/g,"<br />")},_btnCancel_click:function(){this._popupBehavior.hide()},_rgbToHex:function(e){var t=/rgb\s?\(\s?(\d+)\s?,\s?(\d+)\s?,\s?(\d+)\s?\)/.exec(e);return"#"+("000000"+(parseInt(t[3],10)|parseInt(t[2],10)<<8|parseInt(t[1],10)<<16).toString(16)).substr(-6)},_encodeHtml:function(){var e=Sys.Browser.agent==Sys.Browser.InternetExplorer,t=(this._editableDiv.getElementsByTagName("*"),this._editableDiv.innerHTML);if(e){var i=/\<[^\>]+\>/g;t=t.replace(i,function(e){var t="",i="";return"<a"!=e.toLowerCase().substring(0,2)?(t=/\=\'([^\'])*\'/g,i=/\=([^\"][^\s\/\>]*)/g,e.replace(t,'="$1"').replace(i,"=$1")):e})}var n=this._rgbToHex,o=function(){t=t.replace(/(\<[^\>]+)(rgb\s?\(\d{1,3}\s?\,\s?\d{1,3}\s?\,\s?\d{1,3}\s?\))([^\>]*\>)/gi,function(e,t,i,o){return(t||"")+(i&&n(i)||"")+(o||"")})};return o(),o(),t=t.replace(/\sclass\=\"\"/gi,"").replace(/\sid\=\"\"/gi,""),t=t.replace(/\<(\/?)strong\>/gi,"<$1b>").replace(/\<(\/?)em\>/gi,"<$1i>"),t=t.replace(/&(?!g|lt;)/gi,"&amp;").replace(/\xA0/gi,"&nbsp;"),t=t.replace(/</gi,"&lt;").replace(/>/gi,"&gt;").replace(/\'/gi,"&apos;").replace(/\"/gi,"&quot;")},_editableDiv_submit:function(){this._textbox._element.value=this._encodeHtml()},_isHtmlElement:function(e){return e instanceof HTMLElement},isValidTarget:function(e){return void 0!=e.name&&""!=e.name&&"select"!=e.tagName.toLowerCase()},isSimpleTextDecoration:function(e){return!!e&&("bold"==e.toLowerCase()||"italic"==e.toLowerCase()||"underline"==e.toLowerCase())},_executeCommand:function(e){if(this.isValidTarget(e.target)){var t=this._getSelection();if(null!=t){var i=this._isDescendantOrSelf(this._editableDiv,t.commonAncestorContainer);if(!i)return}var n=Sys.Browser.agent==Sys.Browser.Firefox,o=Sys.Browser.agent==Sys.Browser.Safari,s=Sys.Browser.agent==Sys.Browser.InternetExplorer||null==Sys.Browser.agent,a=Function.createDelegate(this,this._colorPicker_onchange);this.isSimpleTextDecoration(e.target.name)||this._executeStyleWithCssCommand();var r={JustifyRight:1,JustifyLeft:1,JustifyCenter:1,JustifyFull:1,Outdent:1};if(r[e.target.name])try{document.execCommand(e.target.name,!1,null)}catch(t){if(t&&2147500037==t.result){var l=window.getSelection().getRangeAt(0),c=document.createElement("div"),d=!1;c.style.height="1px;","true"==l.startContainer.contentEditable&&(window.getSelection().collapseToEnd(),d=!0);for(var _=window.getSelection().getRangeAt(0).startContainer;_&&"true"!=_.contentEditable;)_=_.parentNode;if(!_)throw"Selected node is not editable!";_.insertBefore(c,_.childNodes[0]),document.execCommand(e.target.name,!1,null),c.parentNode.removeChild(c),d&&window.getSelection().addRange(l)}else window.console&&window.console.log&&window.console.log(t)}else if("createLink"==e.target.name){var h=prompt("Please insert  URL","");h&&document.execCommand("createLink",!1,h)}else if("ForeColor"==e.target.name)this._commandName=e.target.name,this.saveSelection(),this._foreColorPicker||(this._foreColorPicker=$create(Sys.Extended.UI.ColorPickerBehavior,{},{},{},this._foreColor),this._foreColorPicker.set_sample(this._foreColor.parentNode),this._foreColorPicker.add_colorSelectionChanged(a)),this._foreColorPicker.show();else if("BackColor"==e.target.name)this._commandName=e.target.name,this.saveSelection(),this._backColorPicker||(this._backColorPicker=$create(Sys.Extended.UI.ColorPickerBehavior,{},{},{},this._backColor),this._backColorPicker.set_sample(this._backColor.parentNode),this._backColorPicker.add_colorSelectionChanged(a)),this._backColorPicker.show();else if("UnSelect"==e.target.name)if(n){this._editableDiv.focus();var u=window.getSelection();u.collapse(this._editableDiv.firstChild,0)}else document.execCommand(e.target.name,!1,null);else if("InsertImage"==e.target.name){this._isFocusInEditableDiv||this._editableDiv.focus(),this.saveSelection();for(var m=Sys.Application.getComponents(),p=0;p<m.length;p++){var b=m[p];if(Sys.Extended.UI.HtmlEditorExtenderBehavior.isInstanceOfType(b)&&b._popupBehavior._visible)return}this._elementVisible(this._popupDiv,!0),this._popupBehavior.show(),$common.setStyle(this._popupDiv,{position:"fixed",top:"",left:"",opacity:"1"})}else if("CleanWord"==e.target.name)this._editableDiv.innerHTML=this.cleanWordHtml(this._editableDiv.innerHTML);else if("Indent"==e.target.name)if(s)document.execCommand(e.target.name,!1,null);else{var g=this._getSelectionHtml(),v='<blockquote style="margin: 0 0 0 40px; border: none; padding: 0px;"><div>'+g+"</div></blockquote>";document.execCommand("insertHTML",!1,v)}else"InsertHorizontalRule"==e.target.name&&o?document.execCommand("insertHTML",!1,"<hr />"):document.execCommand(e.target.name,!1,null)}},_colorPicker_onchange:function(e){this.restoreSelection(),this.setColor(this._commandName,"#"+e._selectedColor)},setColor:function(e,t){if(/backcolor/i.test(e)){var i=Sys.Browser.agent==Sys.Browser.Firefox;i?(document.execCommand("stylewithcss",!1,!0),document.execCommand("hilitecolor",!1,t),document.execCommand("stylewithcss",!1,!1)):document.execCommand("backcolor",!1,t)}else document.execCommand("stylewithcss",!1,!0),document.execCommand(e,!1,t)},saveSelection:function(){this instanceof Sys.Extended.UI.HtmlEditorExtenderBehavior&&(this._savedRange=this._getSelection())},_getSelection:function(){return window.getSelection?window.getSelection().rangeCount&&window.getSelection().getRangeAt(0):document.selection?document.selection.createRange():null},_getSelectionHtml:function(){var e;if(window.getSelection){if(e=window.getSelection(),e.getRangeAt)var t=e.getRangeAt(0);else{var t=document.createRange();t.setStart(e.anchorNode,e.anchorOffset),t.setEnd(e.focusNode,e.focusOffset)}var i=t.cloneContents(),n=document.createElement("div");return n.appendChild(i),n.innerHTML}return document.selection?(e=document.selection.createRange(),e.htmlText):""},_isDescendantOrSelf:function(e,t){if(!e)return!1;if(!t)return!1;if(e==t)return!0;for(var i=t.parentNode;null!=i;){if(i==e)return!0;i=i.parentNode}return!1},restoreSelection:function(){if(this._isInFocus=!0,null!=this._savedRange)if(window.getSelection){var e=window.getSelection();e.rangeCount>0&&e.removeAllRanges(),e.addRange(this._savedRange)}else document.createRange?window.getSelection().addRange(this._savedRange):document.selection&&this._savedRange.select()},cleanWordHtml:function(e){return e=this._cleanOP(e),e=this._cleanMSO(e),e=this._cleanStyleAttr(e),e=this._cleanLangAttr(e),e=this._cleanXmlNamespaceTags(e),e=this._cleanComments(e),e=this._cleanFontFamily(e),e=this._cleanSpan(e),e=this._cleanB(e)},_cleanOP:function(e){return e=e.replace(/<o:p>\s*<\/o:p>/g,""),e=e.replace(/<o:p>[\s\S]*?<\/o:p>/g,"&nbsp;")},_cleanMSO:function(e){return e.replace(/\s*mso-[^:]+:[^;"]+;?/gi,"")},_cleanFontFamily:function(e){return e.replace(/\s*FONT-FAMILY:[^;"]*;?/gi,"")},_cleanSpan:function(e){return e=e.replace(/<SPAN\s*[^>]*>\s*&nbsp;\s*<\/SPAN>/gi,"&nbsp;"),e=e.replace(/<SPAN\s*[^>]*><\/SPAN>/gi,""),e=e.replace(/<SPAN\s*>([\s\S]*?)<\/SPAN>/gi,"$1"),e=e.replace(/<span>\s*<\/span>/gi,"")},_cleanStyleAttr:function(e){return e.replace(/<(\w[^>]*) style="([^\"]*)"([^>]*)/gi,"<$1$3")},_cleanLangAttr:function(e){return e.replace(/<(\w[^>]*) lang=([^ |>]*)([^>]*)/gi,"<$1$3")},_cleanXmlNamespaceTags:function(e){return e.replace(/<\/?\w+:[^>]*>/gi,"")},_cleanComments:function(e){return e.replace(/<\!--[\s\S]*?-->/g,"")},_cleanB:function(e){return e=e.replace(/<b>\s*&nbsp;\s*<\/b>/gi,""),e=e.replace(/<b>\s*<\/b>/gi,"")},_elementVisible:function(e,t){"FORM"!=e.tagName&&(t?("none"==e.style.display&&(e.style.display="block",e.setAttribute("displayChanged",!0)),"hidden"==e.style.visibility&&(e.style.visibility="visible",e.setAttribute("visibleChanged",!0)),this._elementVisible(e.parentNode,!0)):(e.getAttribute("displayChanged")&&(e.style.display="none",e.removeAttribute("displayChanged")),e.getAttribute("visibleChanged")&&e.removeAttribute("visibleChanged"),this._elementVisible(e.parentNode,!1)))},_raiseEvent:function(e,t){var i=this.get_events().getHandler(e);i&&(t||(t=Sys.EventArgs.Empty),i(this,t))},get_buttonWidth:function(){return this._ButtonWidth},get_ButtonWidth:function(){return Sys.Extended.Deprecated("get_ButtonWidth()","get_buttonWidth()"),this.get_buttonWidth()},set_buttonWidth:function(e){this._ButtonWidth!=e&&(this._ButtonWidth=e,this.raisePropertyChanged("ButtonWidth"))},set_ButtonWidth:function(e){Sys.Extended.Deprecated("set_ButtonWidth(value)","set_buttonWidth(value)"),this.set_buttonWidth(e)},get_buttonHeight:function(){return this._ButtonHeight},get_ButtonHeight:function(){return Sys.Extended.Deprecated("get_ButtonHeight()","get_buttonHeight()"),this.get_buttonHeight()},set_buttonHeight:function(e){this._ButtonHeight!=e&&(this._ButtonHeight=e,this.raisePropertyChanged("ButtonHeight"))},set_ButtonHeight:function(e){Sys.Extended.Deprecated("set_ButtonHeight(value)","set_buttonHeight(value)"),this.set_buttonHeight()},get_toolbarButtons:function(){return this._toolbarButtons},get_ToolbarButtons:function(){return Sys.Extended.Deprecated("get_ToolbarButtons()","get_toolbarButtons()"),this.get_toolbarButtons()},set_toolbarButtons:function(e){this._toolbarButtons!=e&&(this._toolbarButtons=e,this.raisePropertyChanged("ToolbarButtons"))},set_ToolbarButtons:function(e){Sys.Extended.Deprecated("set_ToolbarButtons(value)","set_ToolbarButtons(value)"),this.set_toolbarButtons(e)},get_displaySourceTab:function(){return this._displaySourceTab},set_displaySourceTab:function(e){this._displaySourceTab!=e&&(this._displaySourceTab=e,this.raisePropertyChanged("DisplaySourceTab"))},get_displayPreviewTab:function(){return this._displayPreviewTab},set_displayPreviewTab:function(e){this._displayPreviewTab!=e&&(this._displayPreviewTab=e,this.raisePropertyChanged("DisplayPreviewTab"))},add_change:function(e){this.get_events().addHandler("change",e)},remove_change:function(e){this.get_events().removeHandler("change",e)},get_isDirty:function(){return this._isDirty}},Sys.Extended.UI.HtmlEditorExtenderBehavior.registerClass("Sys.Extended.UI.HtmlEditorExtenderBehavior",Sys.Extended.UI.BehaviorBase);var HtmlEditorExtender_editableDivs=new Array;Sys.Extended.UI.HtmlEditorExtenderBehavior.WebForm_OnSubmit=function(){var e=Sys.Extended.UI.HtmlEditorExtenderBehavior._originalWebForm_OnSubmit();if(e)for(var t=Sys.Application.getComponents(),i=0;i<t.length;i++){var n=t[i];Sys.Extended.UI.HtmlEditorExtenderBehavior.isInstanceOfType(n)&&n._editableDiv_submit()}return e},Sys.Extended.UI.HtmlEditorExtenderBehavior.IsDirty=function(){for(var e=Sys.Application.getComponents(),t=0;t<e.length;t++){var i=e[t];if(Sys.Extended.UI.HtmlEditorExtenderBehavior.isInstanceOfType(i)&&i._isDirty)return!0}return!1},ajaxClientUploadComplete=function(e,t){for(var i=null,n=Sys.Application.getComponents(),o=0;o<n.length;o++){var s=n[o];Sys.Extended.UI.HtmlEditorExtenderBehavior.isInstanceOfType(s)&&s._popupBehavior._visible&&(i=s,o=s.length)}var a=t.get_postedUrl().replace("&amp;","&");if(null!=i)if(i.restoreSelection(),document.selection&&document.selection.createRange)try{i._savedRange.pasteHTML("<img src='"+a+"' />")}catch(e){var r=document.createElement("img");r.src=a,i._savedRange.insertNode(r)}else{var r=document.createElement("img");r.src=a,i._savedRange.insertNode(r)}},Sys.Extended.UI.HtmlEditorExtenderMode={Content:0,Source:1,Preview:2};