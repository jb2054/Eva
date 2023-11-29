let selectRows = [];
let currentModal;
let n = 0;
let tbl = [];
const inputStatus   = document.getElementById('status');
const btnConfigSave = document.getElementById('btn-config-save');
const content       = document.querySelector('.content');
const forms         = document.getElementsByClassName('eva-form');
for (const div of forms) {                                          
    div.setAttribute("style", "height: calc(100vh - 127px); overflow-y: scroll;");               
    tbl[n] = document.createElement('table');
    tbl[n].setAttribute("class", "table table-striped table-hover table-sm table-responsive");              
    div.appendChild(tbl[n]); 
    n = n + 1;
}
const table         = document.getElementsByClassName('eva-table');
for (const div of table) {                                          
    div.setAttribute("style", "height: calc(100vh - 300px); overflow-y: scroll;");               
    tbl[n] = document.createElement('table');
    tbl[n].setAttribute("class", "table table-striped table-hover table-sm table-responsive");              
    div.appendChild(tbl[n]); 
    n = n + 1;
}
function rowSelect(e) {
    console.log('>>rowSelect()...');

    const path = e.path || (e.composedPath && e.composedPath());
    const row  = path[1];

    if (row.cells[0].nodeName  === 'TH') {
        
        const tBody = e.currentTarget.tBodies[0];
        const rows = Array.from(tBody.rows);
        
        let reverse = 1;
        
        const cellIndex = e.target.cellIndex;                
                    
        if (e.target.getAttribute("sort-attr") === "desc" ) {
          reverse = -1;
          e.target.setAttribute("sort-attr", "asc");
        } else {
          reverse = 1;
          e.target.setAttribute("sort-attr", "desc");        
        }
        
        rows.sort((tr1, tr2) => {    
          const tr1Text = tr1.cells[cellIndex].textContent;
          const tr2Text = tr2.cells[cellIndex].textContent;       
          return reverse * (tr1Text.localeCompare(tr2Text));
        });
    
        tBody.append(...rows);

        for (cell of row.cells) {
            cell.style.color = 'black';
        }
        e.target.style.color = 'aquamarine';

    } else {
        let text;
        if (e.ctrlKey) {
            text = 'The CTRL key was pressed!';
            selectRows.push(row);
            row.style.background = 'aquamarine';
            console.log('select_rows count: ', selectRows.length);
        } else {
            text = 'The CTRL key was NOT pressed!';
            for (const rows of selectRows) {
                rows.style.background = '';
            }
            selectRows.splice(0, selectRows.length);
            row.style.background = 'aquamarine';
            selectRows.push(row);
        }
        console.log(text);
    }
}
function dblSelect(e) {
    console.log('>>dblSelect()...');

    if (e.target.nodeName  === 'TH') {
        return;
    } else {
        const currentForm = e.currentTarget.parentNode.parentNode;
            
        const modalTrigger = currentForm.getElementsByClassName('eva-edit');
        if (modalTrigger[0]) {
            console.log('modalTrigger'), modalTrigger;
            modalTrigger[0].onclick();         
        }            
    }
}
function addListeners(showTbl) {
    console.log('>>addListeners()...'); 

    if (showTbl) {
        showTbl.addEventListener('click', rowSelect);
        showTbl.addEventListener('dblclick', dblSelect,{once:false});                        
    }
}
function showTable(showTbl, hide, col, data) {
    console.log('>>showTable()...'); 

    showTbl.innerHTML='';
   
    addListeners(showTbl);

    const thead = document.createElement('thead');
    thead.style.position = 'sticky';  
    thead.style.top      = '0px';
    thead.style.border   = '#00ff92';
    thead.style.background = 'White';  
    showTbl.appendChild(thead);
  
    const tbody = document.createElement('tbody');
    showTbl.appendChild(tbody);
  
    const tr = document.createElement('tr'); 
    thead.appendChild(tr);
    
    for (const e of Object.keys(col)) {             
      const th = document.createElement('th');    
      th.setAttribute("sort-attr", "");                        
      for (const h of hide) {   
        if (e===h)     
        th.style.display = "none";        
      }
      tr.appendChild(th);        
      th.textContent = col[e];      
    }       
  
    if (data) {
        for (const rows of data) {                  
            const tr = document.createElement('tr');
            tbody.appendChild(tr);             
            for (let p of Object.keys(col)) {            
                const td = document.createElement('td');    
                tr.appendChild(td);              
                td.textContent = rows[p];    
                for (const h of hide) {   
                    if (p===h)     
                    td.style.display = "none";        
                }
            }
        } 
    } else {
        console.log('data: '+data)
        return;   
    }
}
function getModal(modalForm) {
    console.log('>>getModal()...');
    let options =  { focus: true };
    currentModal = new bootstrap.Modal(modalForm, options);  
    
    currentModal.show();
}
function logout() {
    console.log('>>Logout()...');
    let mode = content.getAttribute('data-mode');
    console.log(mode);   
}
async function listUsers() {
    console.log('>>listUsers()...');           

    data = await getOnServer('/getusers');

    const inputUserName = document.getElementById('input-username');

    for (let rows of data) {
        
        if (rows['Show']) {
            let option = document.createElement('option');
            option.value = rows['Name'];
            option.text  = rows['Name'];

            inputUserName.appendChild(option);
        }        
    }    
}
//Get/post on Server//////////////////////////////////////////////////////////
async function postOnServer(data, link) {
    console.log('>>postOnServer()...');
    let res;
    try {
        let response = await fetch(link, {
            method  : 'post',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(data)
        });
        res = await response.json();
    } catch (err) {
        console.log(err);
    }
    return res;
}
async function getOnServer(link) {
    console.log('>>getOnServer()...');
    let res;
    try{
        let response = await fetch(link);
        res = await response.json();
    } catch (err) {
        console.log(err)
    }
    return res;
}
//////////////////////////////////////////////////////////////////////////////
async function showUserTable() {
    console.log('>>showUserTable()...');
    
    let data = await getOnServer('/getusers');   

    const col  = { 'id':'Id', 'Name':'Name', 'Descr':'Descr', 'Role':'Role', 'email':'E-mail', 'Show':'Show', 'EAuth':'EAuth' };  
    const hide = ['id'];  

    showTable(tbl[1], hide, col, data);

}
async function userCreate() {
    console.log('>>userCreate()...');
    
    const input_form        = document.getElementById('create-user-form');  
    const createMode = input_form.getAttribute("create-mode");  
    const input_username    = input_form.querySelector('#input-user-name');
    const input_password    = input_form.querySelector('#input-password');
    const input_confirmpass = input_form.querySelector('#input-confirmpass');
    const input_descr       = input_form.querySelector('#input-descr');
    const input_eauth       = input_form.querySelector('#input-eauth');
    const input_show        = input_form.querySelector('#input-show');
    const input_role        = input_form.querySelector('#input-role');

    if (input_password.value !== input_confirmpass.value) alert('Incorrect password confirmation!');
    if (!input_username.value) alert('User name is not filled in!');

    const data =  {
        'id'      : input_form.getAttribute("eva-id"),
        'Name'    : input_username.value,
        'Descr'   : input_descr.value,
        'Password': input_password.value,
        'RoleId'  : input_role.getAttribute("eva-id"),
        'EAuth'   : input_eauth.checked,
        'Show'    : input_show.checked
    };

    // console.log(data);
    
    let result;
    // console.log('createMode: '+createMode);
    if (createMode==='true') {
        try {
            result = await postOnServer(data, '/createuser')
            console.log('create: '+result);        
        } catch (e) {
            console.log(e);
        }
    } else {
        try {
        result = await postOnServer(data, '/updateuser');
        console.log('create: '+result);          
        } catch (e) {
        console.log(e);
        }
    }
    if (result) await showUserTable();

}
async function userCreateModal() {
    console.log('>>userCreateModal()...');     

    const modalForm         = document.getElementById('userModal'); 
    getModal(modalForm); 
    const inputLabel        = modalForm.querySelector("#userModalLabel");
    inputLabel.innerText = 'Add user*:';      
    const input_form        = modalForm.querySelector('#create-user-form');  
    input_form.reset(); 
    input_form.setAttribute("create-mode",true);            
}
async function userEditModal() {
    console.log('>>userEditModal()...'); 
  
    if (selectRows.length === 0) { return };

    const row = selectRows[0];      
   
    const modalForm         = document.getElementById('userModal'); 
    getModal(modalForm); 
    const inputLabel        = modalForm.querySelector("#userModalLabel");
    const input_form        = modalForm.querySelector('#create-user-form');  
    input_form.reset();  
    const input_name        = input_form.querySelector('#input-user-name');  
    const input_descr       = input_form.querySelector('#input-descr');    
    const input_email       = input_form.querySelector('#input-email');    
    const input_role        = input_form.querySelector('#input-role');           
    const input_password    = input_form.querySelector('#input-password');    
    const input_confirmpass = input_form.querySelector('#input-confirmpass'); 
    const input_show        = input_form.querySelector('#input-show');
    const input_eauth       = input_form.querySelector('#input-eauth');

    input_form.setAttribute("create-mode",false);    
    inputLabel.innerText = 'Edit user:';

    let data = { 'id': row.cells[0].innerText};

    let result = await postOnServer(data,'/getuser');    
    if (result) {       
        let elem = result[0];
        input_form.setAttribute("eva-id", elem.id);
        input_name.value        = elem.Name;
        input_descr.value       = elem.Descr;   
        input_email.value       = elem.email;   
        input_role.value        = elem.Role;           
        input_role.setAttribute("eva-id", elem.RoleId);
        input_password.value    = '';   
        input_confirmpass.value = '';               
        if (elem.Show === true) {
            input_show.checked = true;
        } else {  
            input_show.checked = false;
        }  
        if (elem.EAuth === true) {
            input_eauth.checked = true;
        } else {  
            input_eauth.checked = false;
        }      
    }   
}
async function userDelete() {
    console.log('>>userDelete...');
    let result;
    for (const row of selectRows){

        let data = {'id': row.cells[0].innerText};

        result = await postOnServer(data,'/deluser');        
    }

    if (result) await showUserTable();
}
/////////////////////////////////////////////////////////////////////////////
async function showRoleTable() {
    console.log('>>showRoleTable()...');
    
    let data = await getOnServer('/getroles');   

    // console.log(data);

    const col  = { 'id':'Id', 'Name':'Name' };  
    const hide = ['id'];  

    showTable(tbl[2], hide, col, data);

}
async function roleCreate() {
    console.log('>>roleCreate...');

    const input_rolename    = document.getElementById('input-rolename')
    
    if (!input_rolename.value) alert('The name is not filled in!');

    const data =  {
        'Name'    : input_rolename.value,
    };
    
    let result;
    try {
        result = await postOnServer(data,'/createrole')
        //console.log(result);        
    } catch (e) {
        console.log(e);
    }

    if (result) await showRoleTable();

}
async function userEditRole() {
  console.log('>>userEditRole...'); 

  let modalForm = document.getElementById("editUserRoleModal");

  getModal(modalForm);

  let data = await getOnServer('/getroles');  

  const col = {'id':'Id', 'Name':'Name'};  
  const hide = ['id'];
  
  showTable(tbl[3], hide, col, data);
 
}
async function roleSelect() {
  console.log('>>roleSelect...'); 

    if (selectRows.length === 0) return;

    const row = selectRows[0];  

    const input_role        = document.getElementById('input-role');    

    input_role.value        = row.cells[1].innerText;
    input_role.setAttribute("eva-id", row.cells[0].innerText);

    await currentModal.hide();
           
}
async function roleDelete() {
    console.log('>>roleDelete...');
    let result;
    for (const row of selectRows){

        let data = {'id': row.cells[0].innerText};

        result = await postOnServer(data,'/delrole');        
    }

    if(result) await showRoleTable();
}
/////////////////////////////////////////////////////////////////////////////
async function showConfigTable() {
    console.log('>>showConfigTable...');
    
    let tmp  = await getOnServer('/getconfig');     
    let data = [];

    for (const row of tmp) {
        let strJson = row.data; 
        let Elements = await JSON.parse(strJson);

        if (row.state===0||row.state===1||row.state===3) {
            data.push(Object.assign({'id':row.id}, Elements));
        }
    }

    const col  = { 'id':'Id', 'typeId':'Type',  'textId': 'Identifier'};  
    const hide = ['id'];  

    await showTable(tbl[0], hide, col, data);

    inputStatus.value = '>>Ready...';

}
async function objectCreate(e) {
    console.log('>>configCreate()...');

    const input_form   = document.getElementById('create-object-form'); 
    const input_type   = input_form.querySelector('#input-type');
    const input_textId = input_form.querySelector('#input-textId');    
    const input_subsystem  = input_form.querySelector('#input-subsystem');      
    const createMode = input_form.getAttribute("create-mode");  
    
    if (!input_form.checkValidity()) {
        await e.preventDefault();
        await e.stopPropagation();        
    }
    
    const tmp = { 
        typeId    : input_type.value, 
        textId    : input_textId.value,
        subsysId  : input_subsystem.getAttribute("eva-id"),
        subsysName: input_subsystem.value        
    }          

    const data =  {
        'id'      : input_form.getAttribute("eva-id"),
        'data'    : JSON.stringify(tmp),
    }
    
    let result;
    console.log('createMode: '+createMode);
    if (createMode==='true') {
        try {
            result = await postOnServer(data, '/createobject')
            console.log(result);        
        } catch (e) {
            console.log(e);
        }
    } else {
        try {
            result = await postOnServer(data, '/editobject')
            console.log(result);        
        } catch (e) {
            console.log(e);
        }
    }

    await currentModal.hide();

    if (result) await showConfigTable();

    //btnConfigSave.removeAttribute("disabled");
    btnConfigSave.style.backgroundColor = 'red';

}
async function objectModal() {
    console.log('>>objectModal()...'); 

    const modalForm = document.getElementById("objectModal");

    getModal(modalForm);

    const objectModalLabel = modalForm.querySelector('#objectModalLabel');  
    objectModalLabel.innerText = 'Add object';

    const input_form      = modalForm.querySelector('#create-object-form'); 
    input_form.reset();    
    input_form.setAttribute("create-mode",true);   

    const input_type      = input_form.querySelector('#input-type');
    input_type.removeAttribute("disabled");

    const input_subsystem = input_form.querySelector('#input-subsystem');  
    input_subsystem.removeAttribute("disabled");     

}
async function objectEditModal() {
    console.log('>>objectEditModal...'); 
  
    if (selectRows.length === 0) return;

    const modalForm = document.getElementById("objectModal");
  
    const row = await selectRows[0];  

    const objectModalLabel = modalForm.querySelector('#objectModalLabel');  
    objectModalLabel.innerText = 'Edit object:';

    const input_form      = modalForm.querySelector('#create-object-form');    
    
    input_form.reset();
    input_form.setAttribute("create-mode",false);   

    const input_type      = input_form.querySelector('#input-type');
    input_type.setAttribute("disabled","disabled");    
    const input_textId    = input_form.querySelector('#input-textId');   
    const input_subsystem = input_form.querySelector('#input-subsystem');  

    getModal(modalForm);

    let data = { 'id': row.cells[0].innerText };

    res = await postOnServer(data,'/getobject');
    if (res) {

        let strJson = res[0].data;          
        let Elements = await JSON.parse(strJson);        

        input_form.setAttribute("eva-id", res[0].id);
        input_type.value        = Elements.typeId;        
        input_textId.value      = Elements.textId;
        input_subsystem.value   = Elements.subsysName;
        input_subsystem.setAttribute("eva-id", Elements.subsysId);
        
        //console.log(Elements.typeId);
        // if (Elements.typeId==='Subsystem'||Elements.typeId==='Constant') {            
        //     input_subsystem.setAttribute("disabled","disabled"); 
        //     subsystemBtn.setAttribute("disabled","disabled"); 
        // } else {
        //     input_subsystem.removeAttribute("disabled"); 
        //     subsystemBtn.removeAttribute("disabled"); 
        // }
    }    

    await showRequisiteTable();
}
async function objectDelete() {
    console.log('>>objectDelete()...');
    let result;
    for (const row of selectRows){

        let data = {'id': row.cells[0].innerText};

        result = await postOnServer(data,'/delobject');        
    }

    if(result) await showConfigTable();

    btnConfigSave.style.backgroundColor = 'red';
}
async function updateConfig() {
    console.log('>>updateConfig...');
    inputStatus.value = '>> Update config in DB...';

    let tmp  = await getOnServer('/getconfig');     
    let data = [];

    for (const row of tmp) {
        console.log(row.state);
        if (row.state===1||row.state===2||row.state===3) {
            let strJson = row.data; 
            let Elements = await JSON.parse(strJson);
            console.log(Elements);
            
            data.push(Object.assign({'id':row.id, 'state':row.state}, Elements));
        }
    }

    result = postOnServer(data, '/updateconf');

    btnConfigSave.style.backgroundColor = '#282c34';

    if(result) await showConfigTable();

    inputStatus.value = '>> Config update completed!';
       
}
/////////////////////////////////////////////////////////////////////////////
async function showSubsystemsTable() {
    console.log('>>showSubsystemsTable()...');

    let data = await getOnServer('/subsystems');  
  
    const col = {'id':'Id', 'name':'Name', 'display':'Display subsystem'};  
    const hide = ['id'];
    
    await showTable(tbl[6], hide, col, data);

}
async function subsystemSelect() {
    console.log('>>selectSubsystem...');
    inputStatus.value = '>> Select subsystem...';

    if (selectRows.length === 0) return;

    const row = selectRows[0];  
  
    const inputSubsystem     = document.getElementById('input-subsystem');            
  
    inputSubsystem.value  = row.cells[1].innerText;
    inputSubsystem.setAttribute("eva-id", row.cells[0].innerText);
  
    await currentModal.hide();
}
async function objectEditSubsystem() {

    let modalForm = document.getElementById("editSubsystemModal");

    getModal(modalForm);
  
    await showSubsystemsTable();

}
/////////////////////////////////////////////////////////////////////////////
async function showRequisiteTable() {
    console.log('>>showRequisiteTable()...');

    const ownerForm     = document.getElementById('create-object-form');  
    const id = ownerForm.getAttribute("eva-id");

    const getData = {'owner': id}
    let tmp = await postOnServer(getData,'/getreqs');  

    let data = [];

    for (const row of tmp) {
        let strJson = row.data; 
        let Elements = await JSON.parse(strJson);

        data.push({'id':row.id, 'textId':Elements.textId, 'type':Elements.type});    
    }
  
    const col = {'id':'Id','textId':'Identifier','type':'Type'};  
    const hide = ['id'];
    
    showTable(tbl[4], hide, col, data);

}
async function reqModal() {
    console.log('>>reqModal()...');

    const inputOwnerForm  = document.querySelector('#create-object-form'); 
    if (!inputOwnerForm.checkValidity()) {    
        alert('The main identifier is not valid!')
        return;
    }
    
    const modalForm  = document.getElementById("requisiteModal");
    const objectModalLabel = modalForm.querySelector('#requisiteModalLabel');  
    objectModalLabel.innerText = 'Add requisite:';

    const inputForm  = modalForm.querySelector("#create-req-form");
    inputForm.reset();    
    inputForm.setAttribute("create-mode",true);  

    getModal(modalForm);
}
async function reqEditModal() {
    console.log('>>reqEditModal()...');

    if (selectRows.length === 0) return;

    const modalForm  = document.getElementById("requisiteModal");    

    const objectModalLabel = modalForm.querySelector('#requisiteModalLabel');  
    objectModalLabel.innerText = 'Edit requisite:';

    const inputForm  = modalForm.querySelector("#create-req-form");
    inputForm.reset();    
    inputForm.setAttribute("create-mode",false);  

    getModal(modalForm);

    const row = await selectRows[0];  

    let data = { 'id': row.cells[0].innerText };

    let res = await postOnServer(data,'/getreq');

    const inputReqId    = inputForm.querySelector("#input-req-id");
    const inputReqType  = inputForm.querySelector("#input-req-type");
    const inputReqDescr = inputForm.querySelector("#input-req-descr");

    // console.log(res);
  
    if (res) {

        let strJson = res.data;                  
        let Elements = await JSON.parse(strJson);    

        inputForm.setAttribute("eva-id", res.id);
        inputReqId.value       = Elements.textId;
        inputReqType.value     = Elements.type;
        inputReqDescr.value    = Elements.descr;
    }
}
async function reqCreate(e) {
    console.log('>>reqCreate()...');

    const ownerForm     = document.getElementById('create-object-form');  
    const inputForm     = document.getElementById("create-req-form");
    const inputReqId    = inputForm.querySelector("#input-req-id");
    const inputReqType  = inputForm.querySelector("#input-req-type");
    const inputReqDescr = inputForm.querySelector("#input-req-descr");
    const createMode    = inputForm.getAttribute("create-mode"); 

    if (!inputForm.checkValidity()) {
        await e.preventDefault();
        await e.stopPropagation();        
    }

    let tmp = { 
        textId    : inputReqId.value, 
        type      : inputReqType.value,        
        descr     : inputReqDescr.value
    };          

    const data =  {
        'id'      : inputForm.getAttribute("eva-id"),
        'owner'   : ownerForm.getAttribute("eva-id"),
        'data'    : JSON.stringify(tmp),
    };

    let result;
    if (createMode==='true') {
        try {
            result = await postOnServer(data, '/createreq')
            console.log(result);        
        } catch (e) {
            console.log(e);
        }
    } else {
        try {
            result = await postOnServer(data, '/editreq')
            console.log(result);        
        } catch (e) {
            console.log(e);
        }
    }

    await currentModal.hide();

    if (result) await showRequisiteTable();    
}
async function reqDelete() {
    console.log('>>reqDelete()...');
    
    for (const row of selectRows){

        const data = {'id': row.cells[0].innerText};

        res = await postOnServer(data,'/delreq');        
    }

    if(res) await showRequisiteTable();
}
/////////////////////////////////////////////////////////////////////////////
window.onload = function() {
    try {
        const logged = content.getAttribute("data-logged");
        if (logged==='true') return;
        listUsers();                
    } catch(e) {
        console.log(e);
    }
}
function loginMode() {
    console.log('>>loginMode()...'); 

    const logged = content.getAttribute("data-logged");   
    const mode   = content.getAttribute("data-mode");

    //console.log('logged: ' + logged);
 
    if (mode==='true'&&logged==='true') {           
        showConfigTable();
    } else {
        return;
    }    
}
document.addEventListener('DOMContentLoaded', loginMode());