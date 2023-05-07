import { useEffect, useState } from "react";

export const UsersList = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    const getUsers = async () => {
      const response = await fetch("http://localhost:8080/manage/user");
      const data = await response.json();
      setUsers(data);
      console.log(data);
    };

    getUsers();
  }, []);

  return (
    <div className="container">
      <div className="userlist bg-white p-4 rounded-md shadow-md max-w-md mt-20">
        <h2 className="text-2xl font-bold mb-4">Users</h2>
        {users.length > 0 ? (
          <ul className="py-5 divide-y divide-gray-200">
            {users.map((user: any) => (
              <li
                key={user.userId}
                className="bg-white rounded-lg shadow-md py-4 px-6 hover:shadow-lg transition-shadow duration-300"
              >
                <div className="flex flex-col md:flex-row items-center justify-between">
                  <div className="flex items-center mb-2 md:mb-0">
                    <div className="w-10 h-10 rounded-full overflow-hidden mr-4">
                      <img
                        className="w-full h-full object-cover"
                        src={`https://picsum.photos/id/${user.userId}/100/100`}
                        alt={`Profile picture for ${user.username}`}
                      />
                    </div>
                    <div>
                      <h3 className="text-lg font-medium text-gray-800 mb-1">
                        {user.username}
                      </h3>
                      <p className="text-gray-500 text-sm">{user.email}</p>
                    </div>
                  </div>
                  <span className="ml-5 text-gray-500 text-sm">User Id: {user.userId}</span>
                </div>
              </li>
            ))}
          </ul>
        ) : (
          <p className="text-gray-500">Loading users...</p>
        )}
      </div>
    </div>
  );
};
