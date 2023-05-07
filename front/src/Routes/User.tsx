import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { Sidebar } from "../components/Sidebar";
import {PopUpDeletion} from '../components/PopUpDeletion';

export const User = () => {
  const [users, setUsers]: Array<any> = useState([]);
  const [isDel, setIsDel] = useState(false);

  useEffect(() => {
    const getUsers = async () => {
      const response = await fetch("http://localhost:8080/manage/user");
      const data = await response.json();
      setUsers(data);
    };
    getUsers();
  }, []);

  let { userId } = useParams();

  if (users[0] == undefined) return <h2>Alineiro</h2>;

  const user = users.filter((user: any) => user.userId == userId)[0];


  return (
    <>
      <Sidebar />
      <div className="container my-24 px-6 mx-auto">
        <div className="bg-white rounded-lg shadow-lg overflow-hidden">
          <div className="p-4">
            <h3 className="text-lg font-medium text-gray-900 mb-2">
              {user.username}
            </h3>
            <p className="text-gray-600">ID: {user.userId}</p>
            <p className="text-gray-600">Email: {user.email}</p>
            <p className="text-gray-600">Password: {user.password}</p>
            <div className="mt-4 flex justify-end">
              <button
                className="bg-red-500 hover:bg-red-600 text-white font-semibold py-2 px-4 rounded mr-4"
              >
                Eliminar
              </button>
              <button
                className="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded"
              >
                Editar
              </button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};
