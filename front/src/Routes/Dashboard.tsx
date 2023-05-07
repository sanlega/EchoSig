import {UsersList} from "../ApiTest";
import { Sidebar } from "../components/Sidebar";

export const Dashboard = () => {
  return (
    <>
      <Sidebar />
      <UsersList />
    </>
  );
};
