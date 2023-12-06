
## dxi-item
```xml
<dxi-item dataField="MyFieldName" editorType="dxCheckBox"></dxi-item>
```
editorType can be:
* dxCheckBox
* dxTextBox
* dxTextArea
* dxTagBox
* dxSelectBox
* dxDateBox


## Form
```xml
<form (submit)="save($event)">
  <dx-form [formData]="myObjectData" labelMode="floating">
    <dxi-item itemType="group" caption="caption for group" [colCount]="3">
      <dxi-item dataField="id" [editorOptions]="{readOnly:true}"></dxi-item>
      <dxi-item dataField="createdDate" editorType="dxDateBox"></dxi-item>
      <dxi-item dataField="isActive"></dxi-item>
    </dxi-item>

    <!-- 3 columns -->
    <dxi-item itemType="group" [colCount]="3">
      <dxi-item itemType="empty"></dxi-item>
      <dxi-item itemType="empty"></dxi-item>
      <dxi-item itemType="group" [colCount]="2">
        <dxi-item itemType="button"
          [buttonOptions]="{text: 'Revert', icon: 'revert', disabled: !dirty, stylingMode: 'outlined', onClick: revert}">
        </dxi-item>

        <dxi-item itemType="button"
          [buttonOptions]="{text: 'Update', icon: 'save', useSubmitBehavior: true, disabled: !dirty, stylingMode: 'outlined'}">
        </dxi-item>
      </dxi-item>
    </dxi-item>

  </dx-form>
</form>
```
