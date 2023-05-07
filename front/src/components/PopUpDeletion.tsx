import { useState } from "react";

export const PopUpDeletion = () => {
  const [isOpen, setIsOpen] = useState(false);

  const handleDeleteUser = () => {
    // onDeleteUser();
    setIsOpen(false);
  };

  return (
    <>
      <button
        className="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded"
        onClick={() => setIsOpen(true)}
      >
        Eliminar usuario
      </button>

      {isOpen && (
        <div className="fixed z-10 inset-0 overflow-y-auto">
          <div className="flex items-center justify-center min-h-screen">
            <div className="bg-white w-full max-w-md p-6 rounded-lg shadow-lg">
              <div className="text-center">
                <h3 className="text-lg font-medium text-gray-900 mb-2">
                  ¿Estás seguro que quieres eliminar este usuario?
                </h3>
                <p className="text-gray-600">
                  Esta acción no se puede deshacer.
                </p>
              </div>
              <div className="mt-6 flex justify-center space-x-4">
                <button
                  className="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded"
                  onClick={handleDeleteUser}
                >
                  Eliminar
                </button>
                <button
                  className="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded"
                  onClick={() => setIsOpen(false)}
                >
                  Cancelar
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
};
