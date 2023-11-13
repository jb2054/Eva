const Router = require('express');
const router = new Router();
const controller = require('../controllers/controller.js');

//Developer
router.get('/', controller.Auth);
router.post('/', controller.Signin);

router.get('/users', controller.getUsers);
router.post('/getuser', controller.getUser);
router.post('/createuser', controller.createUser);
router.post('/updateuser', controller.updateUser);
//router.delete('/delete/:id([0-9]+)', controller.delete)
router.post('/deluser', controller.deleteUser);

router.get('/roles', controller.getRoles);
router.post('/createrole', controller.createRole);
router.post('/delrole', controller.deleteRole);

router.get('/config', controller.getConfig);
router.post('/createconf', controller.createConfig);
router.post('/delconf', controller.deleteConfig);
router.post('/editobject', controller.editObject);
router.post('/getobject', controller.getObject);

router.post('/updateconf', controller.updateConfig);

//eva-app
router.get('/subsystems', controller.getSubsystems);
router.post('/getrefs', controller.getReferences);
router.post('/getref', controller.getReference);
router.post('/createref', controller.createReference);
router.post('/delref', controller.deleteReference);

module.exports = { router }                                                  