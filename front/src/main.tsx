import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "./index.css";
import { Dashboard } from "./Routes/Dashboard";
import { ErrorPage } from "./Routes/ErrorPage";
import { GetStarted } from "./Routes/GetStarted";
import { AddUser } from "./Routes/AddUser";
import { User } from "./Routes/User";

const router = createBrowserRouter([
  {
    path: "/",
    element: <GetStarted />,
    errorElement: <ErrorPage />,
  },
  {
    path: "/dashboard",
    element: <Dashboard />,
  },
  {
    path: "/adduser",
    element: <AddUser />,
  },
  {
    path: "/user/:userId",
    element: <User />,
  },
]);

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
