import { useState } from "react";
import { Link } from "react-router-dom";

export const Sidebar = () => {
  const [isActive, setIsActive] = useState(false);

  const handleClick = () => {
    setIsActive(!isActive);
  };

  return (
    <>
      <div className="lg:hidden">
        <button
          className={`py-2 px-4 bg-blue-500 hover:bg-blue-700 text-white font-bold rounded`}
          onClick={handleClick}
        >
          button
        </button>
      </div>
      <div
        className={`fixed top-0 left-0 w-screen ${
          isActive ? "block" : "hidden"
        }`}
      >
        <div className="bg-gray-100 border-r">
          <div className="px-8 py-4">
            <ul className="">
              <li>
                <Link to={"/dashboard"}>Dashboard</Link>
              </li>
              <li>
                <Link to={"/adduser"}>Add User</Link>
              </li>
              <li>
                <Link to={"/userlist"}>User List</Link>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div className="relative lg:block hidden ">
        <div className="flex justify-center gap-y-3 fixed inset-y-0 left-0 w-64 bg-gray-100 border-r">
          <div className="px-8 py-4">
            <ul>
              <li>
                <Link to={"/dashboard"}>Dashboard</Link>
              </li>
              <li>
                <Link to={"/adduser"}>Add User</Link>
              </li>
              <li>
                <Link to={"/userlist"}>User List</Link>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </>
  );
};
