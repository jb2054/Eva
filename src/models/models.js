const sequelize     = require('../db');
const { DataTypes } = require('sequelize');

//sequelize.sync({ force: true })
//console.log('DB DROP and CREATE all tables!')

const User = sequelize.define('User', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    Name: {type: DataTypes.STRING(50), unique: true},
    Descr: {type: DataTypes.STRING(150)},    
    EAuth: {type: DataTypes.BOOLEAN},
    Show: {type: DataTypes.BOOLEAN},
    Password: {type: DataTypes.STRING(100)},
    email: {type: DataTypes.STRING(50)},
    AdmRole: {type: DataTypes.BOOLEAN, defaultValue: 'false'}
})

const Role = sequelize.define('Role', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    Name: {type: DataTypes.STRING(50), unique: true}
})

const Config = sequelize.define('Config', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    state: {type: DataTypes.INTEGER},
    data:  {type: DataTypes.TEXT}
})

const Subsystem = sequelize.define('Subsystem', {
    id:   {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},    
    name: {type: DataTypes.STRING(50), unique: true},
    display: {type: DataTypes.BOOLEAN, defaultValue: 'true'}
})

const Constant = sequelize.define('Constant', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},    
    name:  {type: DataTypes.STRING(150), unique: true},
    uuidType: {type: DataTypes.STRING(37), unique: true, defaultValue: sequelize.UUIDV4},
})

const Module = sequelize.define('Module', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},    
    name:  {type: DataTypes.STRING, unique: true},
    xbase64: {type: DataTypes.TEXT}
})

const Requisite = sequelize.define('Requisite', {
    id    : {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},  
    owner : {type: DataTypes.INTEGER},
    data  : {type: DataTypes.TEXT}
})

const Form = sequelize.define('Form', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},    
    name:  {type: DataTypes.STRING, unique: true},
    xbase64: {type: DataTypes.TEXT}
})

Role.hasOne(User);
User.belongsTo(Role);

sequelize.sync({alter: true});
console.log('DB UPDATE all tables!');

module.exports = {
    User,
    Role,
    Config,
    Subsystem,
    Constant,
    Module, 
    Requisite,
    Form
}