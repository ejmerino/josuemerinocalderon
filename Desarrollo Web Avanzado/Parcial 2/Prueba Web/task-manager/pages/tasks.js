import { useState, useEffect } from 'react';
import axios from 'axios';

const Tasks = () => {
  const [tasks, setTasks] = useState([]);
  const [formData, setFormData] = useState({
    title: '',
    description: '',
  });

  const { title, description } = formData;

  useEffect(() => {
    const fetchTasks = async () => {
      const res = await axios.get(`${process.env.NEXT_PUBLIC_API_URL}/tasks`, {
        headers: {
          'x-auth-token': localStorage.getItem('token'),
        },
      });
      setTasks(res.data);
    };

    fetchTasks();
  }, []);

  const onChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

  const onSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post(
        `${process.env.NEXT_PUBLIC_API_URL}/tasks`,
        formData,
        {
          headers: {
            'x-auth-token': localStorage.getItem('token'),
          },
        }
      );
      setTasks([...tasks, res.data]);
    } catch (err) {
      console.error(err.response.data);
    }
  };

  return (
    <div>
      <form onSubmit={onSubmit}>
        <input type="text" name="title" value={title} onChange={onChange} required />
        <input type="text" name="description" value={description} onChange={onChange} />
        <button type="submit">Add Task</button>
      </form>
      <ul>
        {tasks.map((task) => (
          <li key={task._id}>{task.title}</li>
        ))}
      </ul>
    </div>
  );
};

export default Tasks;
