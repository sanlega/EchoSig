import React from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import App from "./App.tsx";
import "./index.css";
import { Dashboard } from "./Routes/Dashboard";
import { ErrorPage } from "./Routes/ErrorPage";
import { GetStarted } from "./Routes/GetStarted";
import { AddUser } from "./Routes/AddUser";

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
]);

ReactDOM.createRoot(document.getElementById("root") as HTMLElement).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
