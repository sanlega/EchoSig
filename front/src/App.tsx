import "./App.css";
import { Dashboard } from "./components/Dashboard";
import { Form } from "./components/Form";
import { Map } from "./components/Map";
import { GetStarted } from "./Routes/GetStarted";

function App() {
  return (
    <>
      <Dashboard />
      <Map />
      <Form />
    </>
  );
}

export default App;
