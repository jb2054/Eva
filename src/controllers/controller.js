const { User }     = require('../models/models.js');
const { content }  = require('../index.js');

exports.Auth = (req,res) => {
    content.logged = false;       
    res.render("index.twig", content); 
}  
exports.Signin = (req,res) => {

    if(!req.body) return res.sendStatus(400);     

    const username = req.body.username;

    User.findOne({where: {Name: username}}).then(Users => { 
        let objuser = Users;           
        console.log('controller: ', objuser.Name);          

        if(username === objuser.Name) {
            content.logged    = true;
            content.username  = objuser.Name;
            content.firstname = objuser.Descr;
            content.lastname  = '';
        }
                
        res.render("index.twig", content);  

    }).catch(err=>console.log(err));       
} 
exports.getAll = (req, res, next) => {
    User.findAll({raw:true}).then(Users => { 
        // content.breadcrumbs = [{
        //     href : '#',
        //     text : 'root'
        // }];
        res.send(Users);       
        next();
    }).catch(err=>console.log(err));       
}
exports.getOne = (req, res, next) => {
   
}
exports.Create = (req, res) => {

    if(!req.body) return res.sendStatus(400);     
    const {Name, Descr, RolesID, EAuth, Show} = req.body;       
    //console.log(new Date(), 'body', req.body);   
    
    User.findOne({where: {Name: Name}})
    .then(objuser => { 
        //let objuser = Users;          
        if(Name === objuser.Name) {
            //return 
            res.json("error");
        }                                    
    }).catch(err=>console.log(err));  
    
    User.create({        
        Name    : Name, 
        Descr   : Descr,   
        RolesID : RolesID,           
        EAuth   : EAuth,  
        Show    : Show
    }).catch(err=>console.log(err));  
    
    return res.json("Success");
} 
exports.update = (req, res, next) => {
  
}
exports.Delete = (req, res) => {   

    if(!req.body) return res.sendStatus(400);     
    
    const {id} = req.body;       

    console.log('delete: ', id);

    if (id === '1' ) {
        return res.json("error");
    }  else {
        const user = User.destroy({
            where: {
            id: id
            }
        }) 
    }    
    //console.log(user);
    //return res.json("Success");

}