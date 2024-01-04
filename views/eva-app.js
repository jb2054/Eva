let a = [];
selectRows = [];
n = 0;

//Commands on client/////////////////////////////////////////////////////////
async function modalShow() {
    console.log('>>modalShow()...');   
    await selectModal.hide();     
    await currentModal.show();   
}
async function openConst() {
    console.log('>>openRef()...');
        
    const refForm    = document.getElementById("create-const-form");  
    const tabForm    = document.getElementById("const-form");      
    refForm.reset();               
    refForm.setAttribute("eva-id", "Constant");
    refForm.setAttribute("eva-textId", "Constant");

    let tab = new bootstrap.Tab(tabForm);
    tab.show();    

    selectRows = [];

    await showConstTable();
    
    let status = document.getElementById("status");
    status.value = ">It's work!";
}
async function openRef(refName) {
    console.log('>>openRef()...');
    
    // const navRefForm = document.getElementById("nav-References");        
    const tabForm = document.getElementById("ref-form");                      
    const refLink = document.querySelector("#"+refName);
    const refId   = refLink.getAttribute("eva-id");    
    const refType = refLink.getAttribute("eva-type");    
    const evaForm    = document.getElementById("eva-ref-form");  
    evaForm.setAttribute("eva-id", refId);
    evaForm.setAttribute("eva-textId", refName);
    evaForm.setAttribute("eva-typeId", refType);

    let tab = new bootstrap.Tab(tabForm);
    tab.show();    

    selectRows = [];
    if (refType==='Reference') {
        await showRefTable(refName, refType);
    } else {
        await showDocTable(refName, refType);
    }
    let status = document.getElementById("status");
    status.value = ">It's work!";
}
async function getSynonyms(evaForm) {
    console.log('>>getSynonyms()...');

    const id = evaForm.getAttribute("eva-id");
    const datareq = { 'owner': id }
    const resreq = await postOnServer(datareq, '/getreqs');  
    console.log(resreq);
    let arrSyn = [];  
    arrSyn['id'] = 'Id';
    arrSyn['name'] = 'Name';
    for (let elem of resreq) {
        let strJson = elem.data;          
        let Elements = await JSON.parse(strJson);  
        let colName = Elements.textId;
        arrSyn[colName] = Elements.synonum;
    }
    return arrSyn;
}
async function refCreate(e) {
    console.log('>>refCreate()...');

    const refForm    = document.getElementById("create-ref-form");
    const textId     = refForm.getAttribute("eva-textId");
    const typeId     = refForm.getAttribute("eva-typeId");
    const id         = refForm.getAttribute("eva-id");
    let createMode   = refForm.getAttribute("create-mode");     
    let copyMode     = refForm.getAttribute("copy-mode");   
    
    if (!refForm.checkValidity()) {
        await e.preventDefault();
        await e.stopPropagation();        
    }
      
    data = await createReq(refForm, textId, createMode, copyMode); 
    try {
        if (createMode==='true'&&copyMode==='false') {
            result = await postOnServer(data, '/createref');                  
        } else if (createMode==='false'&&copyMode==='true') {             
            result = await postOnServer(data, '/createref');                           
        } else {    
            result = await postOnServer(data, '/updateref');
        }
        // console.log(result);  
    } catch (err) {
        console.log(err);
    }

    await currentModal.hide();

    if (result) await showRefTable(textId, typeId, id);

}
async function refDelete() {
    console.log('>>refDelete()...');

    const refForm = document.getElementById("nav-ref-form");    
    const textId  = refForm.getAttribute("eva-textId");
    
    for (const row of selectRows) {
        const data = {
            'textId': textId,
            'id': row.cells[0].innerText
        }
        result = await postOnServer(data, '/delref');        
    }

    if (result) await showRefTable(textId);
}
async function refModal() {
    console.log('>>refModal()...');      

    const modalForm  = document.getElementById('refModal');  
    currentModal = getModal(modalForm);

    const refModalLabel  = modalForm.querySelector('#refModalLabel');  
    refModalLabel.innerText = 'Add element:';    

    let createMode = true;
    let copyMode   = false;

    const refForm        = modalForm.querySelector('#create-ref-form');  
    refForm.innerHTML = '';
    refForm.reset();   
    refForm.setAttribute("create-mode", createMode);  
    refForm.setAttribute("copy-mode", copyMode);   

    const evaForm = document.querySelector('#eva-ref-form');  
    const textId = evaForm.getAttribute("eva-textId");
    const typeId = evaForm.getAttribute("eva-typeId");
    refForm.setAttribute("eva-textId", textId);

    let arrSyn = await getSynonyms(evaForm);  
    
    const res = await postOnServer({ 'textId': textId }, '/getrefcol');  
    let arr = [];    
    let arrCol = [];  
    for (let elem of res) {
        let colName    = elem.column_name;
        let dataType   = elem.data_type;
        let identifier = elem.dtd_identifier;
        let obj = {'colName': colName, 'dataType':dataType, 'identifier': identifier}
        arr[colName] = '';  
        arrCol[colName] = obj;
    }
    // console.log(arrCol);
    await refElement(refForm, arr, arrCol, arrSyn, createMode, copyMode, typeId);      
}
async function refEditModal(copyMode) {
    console.log('>>refEditModal()...'); 
  
    if (selectRows.length === 0) { return };

    const row = selectRows[0];      

    const modalForm  = document.getElementById('refModal');  

    const refModalLabel    = modalForm.querySelector('#refModalLabel');  
    if (copyMode) {
        refModalLabel.innerText = 'Add element:';
    } else {
        refModalLabel.innerText = 'Edit element:';
    }   

    let createMode = false;    
          
    const refForm    = modalForm.querySelector('#create-ref-form');    
    refForm.reset();  
    refForm.innerHTML = '';     
    refForm.setAttribute("create-mode", createMode);  
    refForm.setAttribute("copy-mode", copyMode);   

    currentModal = getModal(modalForm);

    const evaForm    = document.querySelector('#eva-ref-form');   
    const textId = evaForm.getAttribute("eva-textId");
    refForm.setAttribute("eva-textId", textId);

    arrSyn = await getSynonyms(evaForm);  

    const id     = row.cells[0].innerText;
    const data = { 
        'textId': textId,
        'id': id
    };

    let res = await postOnServer(data, '/getrefcol');       
    let arrCol = [];  
    for (let elem of res) {        
        const colName    = elem.column_name;
        const dataType   = elem.data_type;
        const identifier = elem.dtd_identifier;
      
        let obj = {'colName': colName, 'dataType':dataType, 'identifier': identifier}         
        arrCol[colName] = obj;            
    }

    res = await postOnServer(data, '/getref');  
    await refElement(refForm, res[0], arrCol, arrSyn, createMode, copyMode);     
}
async function constEditModal() {
    console.log('>>constEditModal()...'); 
  
    if (selectRows.length === 0) { return };

    const row = selectRows[0];      

    const modalForm  = document.getElementById('constModal');             
    const inputForm  = modalForm.querySelector('#create-const-form');    
    inputForm.reset();        
      
    const inputName     = inputForm.querySelector('#input-const-name');  
    const inputValue    = inputForm.querySelector('#input-const-value');  
    const constValueBtn = inputForm.querySelector('#input-const-value_btn');     

    inputForm.reset();    

    let data = { 
        'textId' : 'Constant',
        'id'     : row.cells[0].innerText
    }

    let result = await postOnServer(data, '/getref');    
    if (result) {       
        let elem = result[0];
        inputForm.setAttribute("eva-id", elem.id);
        inputName.value        = elem.name;
        inputValue.setAttribute("data-type",elem.type);
         
        inputValue.removeAttribute("disabled"); 
        constValueBtn.setAttribute("hidden","hidden");

        if (elem.type==='String') {
            inputValue.setAttribute("type","text");
            inputValue.setAttribute("class","eva-req form-control"); 
            inputValue.value       = elem.value;              
        } else if (elem.type === 'Number') {
            inputValue.setAttribute("type","text");                    
            inputValue.setAttribute("inputmode","decimal");
            inputValue.setAttribute("class","eva-req form-control");              
            inputValue.setAttribute("pattern", "[0-9.]+");   
            inputValue.setAttribute("maxlength", "15");          
            inputValue.setAttribute("placeholder", "0.00");  
            inputValue.style = "text-align:right;";
            inputValue.value       = elem.value;  
        } else if (elem.type === 'Date') {
            inputValue.setAttribute("type","date");
            inputValue.setAttribute("class","eva-req form-control");            
            const date = new Date(elem.value);                        
            inputValue.value = dateFormat(date).slice(0, 10);
        } else if (elem.type === 'Boolean') {
            inputValue.setAttribute("type","checkbox");
            inputValue.setAttribute("class","eva-req form-check-input");                         
            inputValue.checked       = (elem.value === 'true');                                                     
        } else { 
            inputValue.setAttribute("type","text");
            inputValue.setAttribute("disabled","disabled");
            inputValue.setAttribute("class","eva-req form-control");   
            const refName = elem.type.split('.');
            // console.log(refName);
            
            if (elem.value>0) {
                const ref = await postOnServer({'id':elem.value, 'textId':refName[1]}, '/getref');                                          
                // console.log(ref);
                if (ref) {
                    inputValue.value       = ref[0].name;  
                    inputValue.setAttribute("eva-id", ref[0].id)
                    constValueBtn.removeAttribute("hidden");  
                } else {        
                    inputValue.value       = '';  
                    constValueBtn.removeAttribute("hidden"); 
                }
            }
        }
        
        currentModal = getModal(modalForm); 
    }    
}
async function constSave() {
    console.log('>>constSave()...');

    const inputForm  = document.getElementById("create-const-form");    
    const inputId    = inputForm.getAttribute("eva-id"); 
    const inputValue = inputForm.querySelector("#input-const-value"); 
    const type       = inputValue.getAttribute("data-type");

    let value;
    if (type==='Boolean') {        
        value = inputValue.checked;
    } else if (type==='String'||type==='Number'||type==='Date') {
        value = inputValue.value;
    } else {
        value = inputValue.getAttribute("eva-id");
    }
      
    const data =  {
        'textId'  : 'Constant',
        'id'      : inputId,        
        'value'   : value
    }

    try {  
        result = await postOnServer(data, '/updateref');
        // console.log(result);  
    } catch (err) {
        console.log(err);
    }

    await currentModal.hide();

    if (result) await showConstTable();

}
async function elementBtn(idBtn) {
    console.log('>>elementBtn()...');
  
    const modalForm      = document.getElementById("selectElemModal");
    const inputElemValue = document.querySelector("#"+idBtn.split('_')[0]);
    const inputElemType  = inputElemValue.getAttribute("data-type");

    modalForm.setAttribute("eva-id", idBtn.split('_')[0]);

    const refName = inputElemType.split('.')[1];

    currentModal.hide();

    selectModal = getModal(modalForm);

    refTbl = buildTabpanel(modalForm, "270");

    let tmp = {'textId': refName };
    let data = await postOnServer(tmp, '/getrefs');   

    const col  = { 'id':'Id' ,'name':'Name' };  
    const hide = [];      

    showTable(refTbl, hide, col, data);
}
async function elemSelect() {
    console.log('>>elemSelect()...');
    if (selectRows.length === 0) return;

    const row = selectRows[0];  

    const modalForm       = document.getElementById("selectElemModal");
    const id              = modalForm.getAttribute("eva-id");
    const inputElemValue  = document.querySelector('#'+id);    

    inputElemValue.value        = row.cells[1].innerText;
    inputElemValue.setAttribute("eva-id", row.cells[0].innerText);    

    await selectModal.hide();
    await currentModal.show();
}
async function createReq(refForm, textId, createMode, copyMode) {
    console.log('>>createReq()...');   
    let data =  { 'textId' : textId }

    const evaReqs   = refForm.getElementsByClassName('eva-req');     
    for(let elem of evaReqs) {      
        if ((createMode==='true'||copyMode==='true')&&elem.name==="id") {            
        } else {
            const type     = elem.getAttribute("type");
            const dataType = elem.getAttribute("data-type");
            if (type === 'checkbox') {                 
                data[elem.name] = elem.checked; 
            } else if (type === 'date') {
                if (elem.value === '') {
                    data[elem.name] = new Date('01,01,0001');  
                } else {                    
                    data[elem.name] = new Date(elem.value);                           
                }
            } else if (type === 'number') {
                data[elem.name] = Number(elem.value); 
            } else if (type === 'text') {
                if (dataType === 'numeric') {
                    data[elem.name] = Number(elem.value);  
                } else if (dataType === 'integer') { 
                    data[elem.name] = Number(elem.value);  
                } else if (dataType === 'character varying') {  
                    data[elem.name] = String(elem.value);                   
                } else {         
                    const id = elem.getAttribute("eva-id");  
                    if (id) {
                        data[elem.name] = id;    
                    } else {
                        data[elem.name] = 0;   
                    }
                }
            }
        }    
    } 
    return data;
}
async function docModal() {
    console.log('>>docModal()...');      

    const modalForm  = document.getElementById('docModal');  
    currentModal = getModal(modalForm);

    const refModalLabel  = modalForm.querySelector('#docModalLabel');  
    refModalLabel.innerText = 'Add document:';    

    let createMode = true;
    let copyMode   = false;

    const refForm        = modalForm.querySelector('#create-doc-form');  
    refForm.innerHTML = '';
    refForm.reset();   
    refForm.setAttribute("create-mode", createMode);  
    refForm.setAttribute("copy-mode", copyMode);       

    const evaForm = document.querySelector('#eva-ref-form'); 
    const textId = evaForm.getAttribute("eva-textId");
    const typeId = evaForm.getAttribute("eva-typeId");
    refForm.setAttribute("eva-textId", textId);  

    let arrSyn = await getSynonyms(evaForm);  

    const res = await postOnServer({ 'textId': textId }, '/getrefcol');  
    let arr = [];    
    let arrCol = [];  
    for (let elem of res) {
        let colName    = elem.column_name;
        let dataType   = elem.data_type;
        let identifier = elem.dtd_identifier;
        let obj = {'colName': colName, 'dataType':dataType, 'identifier': identifier}
        arr[colName] = '';  
        arrCol[colName] = obj;
    }

    await refElement(refForm, arr, arrCol, arrSyn, createMode, copyMode, typeId);      
}
async function docCreate(e) {
    console.log('>>docCreate()...');

    const refForm    = document.getElementById("create-doc-form");
    const textId     = refForm.getAttribute("eva-textId");
    let createMode   = refForm.getAttribute("create-mode");     
    let copyMode     = refForm.getAttribute("copy-mode");   
    
    if (!refForm.checkValidity()) {
        await e.preventDefault();
        await e.stopPropagation();        
    }
      
    data = await createReq(refForm, textId, createMode, copyMode);   
    console.log(data);  
    try {
        if (createMode==='true'&&copyMode==='false') {
            result = await postOnServer(data, '/createref');                  
        } else if (createMode==='false'&&copyMode==='true') {   
            // console.log(copyMode);           
            result = await postOnServer(data, '/createref');                           
        } else {    
            result = await postOnServer(data, '/updateref');
        }
        // console.log(result);  
    } catch (err) {
        console.log(err);
    }

    await currentModal.hide();

    if (result) await showDocTable(textId);

}
async function docEditModal(copyMode) {
    console.log('>>docEditModal()...'); 
  
    if (selectRows.length === 0) { return };

    const row = selectRows[0];      

    const modalForm  = document.getElementById('docModal');  

    const refModalLabel    = modalForm.querySelector('#docModalLabel');  
    if (copyMode) {
        refModalLabel.innerText = 'Add document:';
    } else {
        refModalLabel.innerText = 'Edit document:';
    }   

    let createMode = false;    
          
    const refForm    = modalForm.querySelector('#create-doc-form');    
    refForm.reset();  
    refForm.innerHTML = '';     
    refForm.setAttribute("create-mode", createMode);  
    refForm.setAttribute("copy-mode", copyMode);   

    currentModal = getModal(modalForm);

    const evaForm    = document.querySelector('#eva-ref-form');   
    const textId = evaForm.getAttribute("eva-textId");
    const typeId = evaForm.getAttribute("eva-typeId");
    refForm.setAttribute("eva-textId", textId);

    arrSyn = await getSynonyms(evaForm);  

    const id     = row.cells[0].innerText;
    const data = { 
        'textId': textId,
        'id': id
    };

    let res = await postOnServer({ 'textId': textId }, '/getrefcol');         
    let arrCol = [];  
    for (let elem of res) {
        const colName    = elem.column_name;
        const dataType   = elem.data_type;
        const identifier = elem.dtd_identifier;

        let obj = {'colName': colName, 'dataType':dataType, 'identifier': identifier}          
        arrCol[colName] = obj;
    }
    res = await postOnServer(data, '/getref');  
    await refElement(refForm, res[0], arrCol, arrSyn, createMode, copyMode, typeId);     
}
async function docDelete() {
    console.log('>>docDelete()...');

    const refForm = document.getElementById("nav-ref-form");    
    const textId  = refForm.getAttribute("eva-textId");
    
    for (const row of selectRows) {
        const data = {
            'textId': textId,
            'id': row.cells[0].innerText
        }
        result = await postOnServer(data, '/delref');        
    }

    if (result) await showDocTable(textId);
}
//DOM Dynamic Content////////////////////////////////////////////////////////
async function refElement(refForm, col, arrCol, arrSyn, createMode, copyMode, typeId) {
    console.log('>>refElement()...');  
    console.log(col);
    if (col) {                  
        delete col['createdAt'];
        delete col['updatedAt'];
        for (let req of Object.keys(col)) {            
            const label  = document.createElement("label");
            label.setAttribute("for","input-ref-"+req);
            //synonym
            let synom = arrSyn[req];
            if (synom) {
                label.innerText = synom+":";  
            } else {
                label.innerText = req+":";  
            }                           
            refForm.appendChild(label);
            const div  = document.createElement("div");
            div.setAttribute("class", "input-group input-group-sm col-auto");
            refForm.appendChild(div);                
                const input  = document.createElement("input");       
                const btn    = document.createElement("button");
                let type = arrCol[req];
                if (req.split('.').length > 1) {
                    input.setAttribute("type","text");
                    input.setAttribute("class","eva-req form-control"); 
                    input.setAttribute("disabled","disabled");
                    input.setAttribute("data-type", req);
                    const reqName = req.split('.')[1].toLowerCase();
                    input.id    = "input-ref-"+reqName;
                    input.name  = req;
                    btn.setAttribute("class","btn btn-outline-secondary");
                    btn.setAttribute("id","input-ref-"+reqName+"_btn");
                    btn.setAttribute("type","button");
                    btn.setAttribute("onclick","elementBtn(id)");      
                    btn.innerText ="...";
                } else {
                    if (type.dataType === 'character varying') {
                        input.setAttribute("type","text");                    
                        input.setAttribute("class","eva-req form-control");    
                    } else if (type.dataType === 'integer') {
                        input.setAttribute("type","number");                    
                        input.setAttribute("class","eva-req form-control");   
                        input.setAttribute("required", "required");        
                    } else if (type.dataType === 'numeric') {
                        input.setAttribute("type","text");                    
                        input.setAttribute("inputmode","decimal");
                        input.setAttribute("class","eva-req form-control");              
                        input.setAttribute("pattern", "[0-9.]+");   
                        input.setAttribute("maxlength", "15");          
                        input.setAttribute("placeholder", "0.00");  
                        input.style = "text-align:right;";
                    } else if (type.dataType === 'timestamp with time zone') {
                        input.setAttribute("type","date");
                        input.setAttribute("class","eva-req form-control");
                    } else if (type.dataType === 'boolean') {
                        input.setAttribute("type","checkbox");
                        input.setAttribute("class","eva-req form-check-input");     
                    }
                    input.setAttribute("data-type", type.dataType);
                    input.id    = "input-ref-"+req;
                    input.name  = req;
                }
             
                if (req==='id') {
                    input.setAttribute("disabled","disabled");                    
                    if (typeId==='Document') {
                        label.setAttribute("hidden", "hidden");
                        input.setAttribute("hidden", "hidden");
                    }
                }
                if (req==='name') {
                    input.setAttribute("required", "required");
                }
                
                if (createMode===true) {
                    if (type.dataType === 'timestamp with time zone') {
                        const date = new Date('1,1,0001');                        
                        input.value = dateFormat(date).slice(0, 10);
                    } else {
                        input.value = '';
                    }
                } else if (createMode===false) {
                    if (type.dataType === 'boolean') {
                        input.checked = col[req];
                    } else if (type.dataType === 'timestamp with time zone') {
                        const date = col[req];                                               
                        input.value = date.slice(0, 10);
                    } else {
                        if (req.split('.').length > 1) {
                            resRef = await postOnServer({'id': col[req], 'textId':req.split('.')[1]}, '/getref');
                            if (resRef.length===1) {
                                input.value = resRef[0].name;                                
                                input.setAttribute("eva-id", resRef[0].id);
                            } else {
                                input.value = '';
                                input.setAttribute("eva-id", 0);
                            }
                        } else {
                            input.value = col[req];
                        }
                    }                    
                    if (copyMode===true&&input.name==="id") {
                        input.value = '';
                    }
                }                
             
                div.appendChild(input); 
                if (req.split('.').length > 1) div.appendChild(btn);
        }        
    } 
}
function closeTabRef(id) {
    console.log('>>closeTabRef()...');  

    const refForm = document.getElementById("nav-ref-form");
    const ul = refForm.querySelector("#eva-nav-tabs");   

    let navItem = ul.getElementsByClassName("nav-item");    
    const evaLink = document.getElementById(id);   
    if (evaLink) {   
        if (navItem.length > 1) {            
            evaLink.parentElement.remove();  
            const refName = navItem[navItem.length-1].getAttribute("name");   
            openRef(refName);
        } else {
            const Desktop = document.getElementById("Desktop");
            if (Desktop) { 
                evaLink.parentElement.remove();
                Desktop.click();
            }
        }
    }
}
function openTabRef(id, refName) {
    console.log('>>openTabRef()...');  
      
    const evaLink = document.getElementById(id);   
    if (evaLink) {    
        openRef(refName);
    }
}
function buildTable(refName, refType) {
    console.log('>>buildTable()...');  

    const refForm = document.getElementById("nav-ref-form");
    refForm.setAttribute("eva-textId", refName);

    const ul = refForm.querySelector("#eva-nav-tabs");   
    let evaLink = ul.querySelector("#eva-item-"+refName);   
    
    if (!evaLink) {                                   
        const li = document.createElement("li");        
        li.setAttribute("class","nav-item d-flex justify-content-end");                      
        li.setAttribute("id", "eva-item-"+refName);  
        li.setAttribute("name", refName);  
            const a = document.createElement("a");
            a.setAttribute("class","nav-link active p-1 pe-4");                                
            a.setAttribute("href","#");                    
            a.setAttribute("name", refName);  
            a.setAttribute("id", "eva-link-"+refName);                                               
            a.setAttribute("onclick", "openTabRef(id,name)");   
            a.innerText = refName+'s '; 
            const button = document.createElement("button");
            button.setAttribute("type","button");
            button.setAttribute("class","btn-close position-absolute p-2");                
            button.setAttribute("href","#");               
            button.setAttribute("id", "eva-btn-"+refName);            
            button.setAttribute("onclick", "closeTabRef(id)");                                     
        li.appendChild(a);                             
        li.appendChild(button); 
        ul.appendChild(li);          
    }

    const refFormLabel = refForm.querySelector("#refFormLabel"); 
    refFormLabel.innerText = refName+'s';
    
    const btnToolbar = refForm.querySelector(".btn-toolbar");     
    const evaAdd  = btnToolbar.querySelector(".eva-add");
    const evaEdit = btnToolbar.querySelector(".eva-edit");
    const evaCopy = btnToolbar.querySelector(".eva-copy");
    const evaDel  = btnToolbar.querySelector(".eva-del");
    const evaRefresh = btnToolbar.querySelector(".eva-refresh");
    evaRefresh.setAttribute("name", refName);  
    evaRefresh.setAttribute("id", "eva-link-"+refName);   
    if (refType==='Reference') {           
        evaAdd .setAttribute("onclick","refModal()");
        evaEdit.setAttribute("onclick","refEditModal(false)");
        evaCopy.setAttribute("onclick","refEditModal(true)");
        evaDel .setAttribute("onclick","refDelete()");
        evaRefresh.setAttribute("onclick","openTabRef(id,name)");
    } else  if (refType==='Document') {
        evaAdd .setAttribute("onclick","docModal()");
        evaEdit.setAttribute("onclick","docEditModal(false)");
        evaCopy.setAttribute("onclick","docEditModal(true)");
        evaDel .setAttribute("onclick","docDelete()");
        evaRefresh.setAttribute("onclick","openTabRef(id,name)");
    }

    resTbl = buildTabpanel(refForm, "208");
    return resTbl;
}
async function showConstTable() {
    console.log('>>showConstTable()...');   
    
    
    let formTbl = document.getElementById("nav-const-form");    

    resTbl = buildTabpanel(formTbl, "210");

    const tmp = {'textId': 'Constant'}
    result = await postOnServer(tmp, '/getrefs');   
   
    let data = [];
    for (let row of result) {
        let refName = row.type.split('.');
        if (refName[0]==='Reference'&&row.value>0) {            
            ref = await postOnServer({'id':row.value, 'textId':refName[1]}, '/getref');                       
            data.push(Object.assign(row,{'value':ref[0].name}));            
        } else {
            data.push(row);
        }
    }
    // console.log(data); 
    const col  = {'id':'Id', 'name':'Name', 'value':'Value'} 
    const hide = ['id'];      

    showTable(resTbl, hide, col, data);

}
async function showRefTable(refName, refType) {
    console.log('>>showRefTable()...', refName, refType);   

    refTbl = buildTable(refName, refType);

    let tmp = { 'textId': refName };
    let data = await postOnServer(tmp, '/getrefs');

    const evaForm = document.querySelector('#eva-ref-form');    
    
    arrSyn = await getSynonyms(evaForm);  
    console.log(arrSyn);

    // const col  = { 'id':'Id', 'name':'Name' };  
    const res = await postOnServer(tmp, '/getrefcol');  
    let col = {};   
    let colType = {};           
    for (const elem of res) {
        const colName  = elem.column_name;            
        const dataType = elem.data_type;            
        const synom = arrSyn[colName];
        if (synom) {
            col[colName] = synom;  
        } else {
            col[colName] = colName;  
        } 
        colType[colName] = dataType;
    }

    const hide = [];      

    showTable(refTbl, hide, col, data, colType);

}
async function showDocTable(refName, refType) {
    console.log('>>showDocTable()...', refName, refType);   

    refTbl = buildTable(refName, refType);

    let tmp = {'textId': refName };
    let data = await postOnServer(tmp, '/getrefs');   

    const evaForm = document.querySelector('#eva-ref-form');    
    
    arrSyn = await getSynonyms(evaForm);  

    // const col  = { 'id':'Id', 'name':'Name' };  
    const res = await postOnServer(tmp, '/getrefcol');  
    let col = {};   
    let colType = {};           
    for (const elem of res) {
        const colName  = elem.column_name;            
        const dataType = elem.data_type;            
        const synom = arrSyn[colName];
        if (synom) {
            col[colName] = synom;  
        } else {
            col[colName] = colName;  
        } 
        colType[colName] = dataType;
    }

    const hide = ['id'];      

    showTable(refTbl, hide, col, data, colType);

}
function navItem(navTab, name) {    
    const li = document.createElement('li');
    li.setAttribute("class","nav-item");
        a[name] = document.createElement('a');             
        a[name].setAttribute("id", name);      
        a[name].setAttribute("role", "tab");  
        a[name].setAttribute("data-bs-toggle","tab");   
        a[name].setAttribute("data-bs-target","#nav-"+name);
        a[name].setAttribute("aria-controls","nav-"+name);
        if (name=='Desktop') {
            a[name].setAttribute("class","nav-link active");   
            a[name].setAttribute("aria-selected", true);        
        } else {             
            a[name].setAttribute("class","nav-link");      
            a[name].setAttribute("aria-selected", false);
        }
        a[name].innerText = name;    
        a[name].href="#";                 
    li.appendChild(a[name]);     
    navTab.appendChild(li);  

    const evaSubsys = document.querySelector('.eva-subsys'); 
    const subsys = document.createElement("div"); 
    if (name=='Desktop') {    
        subsys.setAttribute("class","tab-pane fade active show");      
    } else {                       
        subsys.setAttribute("class","tab-pane fade");   
    }
    subsys.setAttribute("role","tabpanel");
    subsys.setAttribute("id", "nav-"+name);
    subsys.setAttribute("aria-labelledby","nav-"+name+"-tab");
        const h5 = document.createElement("h5");  
        h5.setAttribute("class","title");
        h5.innerText = name;
        h5.appendChild(document.createElement("hr"));  
    subsys.appendChild(h5);    
    evaSubsys.appendChild(subsys);                   
}
function navLink(nav, name, id, type) {
    console.log('>>navLink()...', type);
    const li = document.createElement('div');
        const a = document.createElement('a');
        a.setAttribute("class","icon-link eva-link p-1");
        a.setAttribute("id", name);           
        a.setAttribute("eva-id", id);  
        a.setAttribute("eva-type", type);
        a.innerText = name+'s';
        a.href="#";
        a.setAttribute("style","color: grey;font-size: 19px;");          
        a.setAttribute("onclick", "openRef(id)");  
    li.appendChild(a);           
    nav.appendChild(li);     
}
async function tabDesk(div) {
    console.log('>>tabDesk()...');

    const a1 = document.createElement('a');
    a1.setAttribute("class","link icon-link");    
    a1.setAttribute("style","color: #555555;font-size: 19px;");  
    a1.href="#";  
    a1.innerText = 'Constants';
    a1.setAttribute("id", "Constants");           
    a1.setAttribute("eva-id", "Constants");  
    a1.setAttribute("onclick", "openConst()");  
    div.appendChild(a1);  
    
    const a = document.createElement('div');
    a.setAttribute("class","icon-link");    
    a.setAttribute("style","color: #555555;font-size: 19px;");     
    a.setAttribute("data-bs-toggle","collapse"); 
    a.setAttribute("data-bs-target","#collapse-link");     
    a.href="#";
    a.innerText = 'References';
        const i = document.createElement("i");
        i.setAttribute("class","fa fa-caret-down");
        i.setAttribute("aria-hidden","true");    
    a.appendChild(i);
    div.appendChild(a);   

    const a3 = document.createElement('div');
    a3.setAttribute("class","icon-link");    
    a3.setAttribute("style","color: #555555;font-size: 19px;");     
    a3.setAttribute("data-bs-toggle","collapse"); 
    a3.setAttribute("data-bs-target","#collapse-link3");     
    a3.href="#";
    a3.innerText = 'Documents';
        const i3 = document.createElement("i");
        i3.setAttribute("class","fa fa-caret-down");
        i3.setAttribute("aria-hidden","true");    
    a3.appendChild(i3);
    div.appendChild(a3); 

    const nav = document.createElement('nav');       
    nav.setAttribute("class","collapse show container-fluid");    
    nav.setAttribute("id","collapse-link");    

    const nav3 = document.createElement('nav');       
    nav3.setAttribute("class","collapse show container-fluid");    
    nav3.setAttribute("id","collapse-link3");  
    
    let data = await getOnServer('/getconfig');
    for (let row of data) {
        let id       = row.id;
        let strJson  = row.data; 
        let elements = await JSON.parse(strJson);
        console.log(elements.typeId);
        if (row.state===0 && elements.typeId==='Reference') {                                                   
            navLink(nav, elements.textId, id, elements.typeId);                    
            a.appendChild(nav);    
        } else if (row.state===0 && elements.typeId==='Document') {    
            navLink(nav3, elements.textId, id, elements.typeId);                    
            a3.appendChild(nav3);                 
        }
    }        
}
async function tabRef(div) {
    console.log('>>tabRef()...');

    let data = await getOnServer('/getconfig');
    for (let row of data) {
        let id       = row.id;
        let strJson  = row.data;         
        let elements = await JSON.parse(strJson);
        if (row.state===0 && elements.typeId==='Reference') {
                    
            const nav = document.createElement('nav');
            nav.setAttribute("class","nav flex-column");                 
                navLink(nav, elements.textId, id, elements.typeId);                    
            div.appendChild(nav);          
        }
    }        
}
async function tabSubsys(div, name) {
    console.log('>>tabSubsys()...');

    let data = await getOnServer('/getconfig');
    for (let row of data) {
        let id       = row.id;
        let strJson  = row.data;         
        let elements = await JSON.parse(strJson);
        if (row.state===0 && (elements.typeId==='Document'||elements.typeId==='Reference') && elements.subsysName===name) {
            // console.log(elements.textId);        
            const nav = document.createElement('nav');
            nav.setAttribute("class","nav flex-column");                 
                navLink(nav, elements.textId, id, elements.typeId);                    
            div.appendChild(nav);          
        }
    }        
}
async function header() {
    console.log('>>header()...');

    const navTab = document.getElementById("eva-nav");      
        const li = document.createElement("li");        
        li.setAttribute("class","nav-item");
        li.setAttribute("hidden","hidden");
            const a = document.createElement("a");
            a.setAttribute("class","nav-link eva-link-ref");
            a.setAttribute("id","ref-form");
            a.setAttribute("data-bs-toggle","tab");
            a.setAttribute("data-bs-target","#nav-ref-form");
            a.setAttribute("role","tab");
            a.setAttribute("aria-controls","nav-ref-form");
            a.setAttribute("aria-selected","false");
        li.appendChild(a);    
    navTab.appendChild(li);
        const li2 = document.createElement("li");        
        li2.setAttribute("class","nav-item");
        li2.setAttribute("hidden","hidden");
            const a2 = document.createElement("a");
            a2.setAttribute("class","nav-link eva-link-const");
            a2.setAttribute("id","const-form");
            a2.setAttribute("data-bs-toggle","tab");
            a2.setAttribute("data-bs-target","#nav-const-form");
            a2.setAttribute("role","tab");
            a2.setAttribute("aria-controls","nav-const-form");
            a2.setAttribute("aria-selected","false");
        li2.appendChild(a2);    
    navTab.appendChild(li2);        
    
    //MAIN
    navItem(navTab, 'Desktop'); 
    navItem(navTab, 'References');         
    navItem(navTab, 'Reports');    

    //DYNAMIC    
    data = await getOnServer('/subsystems');    
    for (let row of data) {        
        navItem(navTab, row.name);           
    }      

    let div = document.querySelector("#nav-Desktop");
    tabDesk(div);  
    div = document.querySelector("#nav-References");
    tabRef(div);  
    div = document.querySelector("#nav-Reports");
    //tabRep(div);   
    //Subsystems
    for (let row of data) {     
        console.log('name', row.name);           
        div = document.querySelector("#nav-"+row.name);
        tabSubsys(div, row.name);
    }  
}
/////////////////////////////////////////////////////////////////////////////
function appContent() {

    const app = document.getElementById('eva-app');
    app.setAttribute("class","col tab-content p-3 eva-subsys");    
    app.style="height:calc(100vh - 95.5px); border: 1px solid #00ff92";

    const status = document.getElementById("status"); 
    status.value='>onload';  
}
function init() {
    
    const mode   = document.querySelector('.content').dataset.mode;
    const logged = document.querySelector('.content').dataset.logged;      
    if (mode==='false'&&logged==='true') {                          
        appContent();
        header();                                           
    } 
}
       
document.addEventListener('DOMContentLoaded', init());