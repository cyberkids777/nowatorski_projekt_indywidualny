const express = require('express');
const mongoose = require('mongoose');
const app = express();
const PORT = 3000;

app.use(express.json());

// Model zadania w bazie danych
const TaskSchema = new mongoose.Schema({
  name: String,
  completed: Boolean
});
const Task = mongoose.model('Task', TaskSchema);

// Połączenie z bazą MongoDB
// WAŻNE: 'mongo' to nazwa serwisu z docker-compose.yml
const DB_URI = 'mongodb://mongo:27017/todos';

mongoose.connect(DB_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch(err => console.error('Could not connect to MongoDB:', err));

// Endpoint 1: Pobierz wszystkie zadania
app.get('/tasks', async (req, res) => {
  const tasks = await Task.find();
  res.json(tasks);
});

// Endpoint 2: Dodaj zadanie
app.post('/tasks', async (req, res) => {
  const newTask = new Task({ name: req.body.name, completed: false });
  await newTask.save();
  res.status(201).json(newTask);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});