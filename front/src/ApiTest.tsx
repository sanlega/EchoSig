export const ApiTest = () => {

  const data = async () => {
    const req = await fetch("http://localhost:8080/");
    // const res = await req;

    console.log(res);
  }

  data();

  return (
    <>
      <h1>From Api</h1>
    </>
  );
};
