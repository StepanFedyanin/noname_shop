const express = require('express')
const mysql = require('mysql')
const path = require('path')




const app = express();
app.use(express.json())


const pruduct_list = ['', '', '', '', '', '', '', '', ''];

app.get('/api/pruductlist', (reg, res) => {
	res.json(pruduct_list);
})

app.listen(5000, () => {
	console.log('server is running');
})