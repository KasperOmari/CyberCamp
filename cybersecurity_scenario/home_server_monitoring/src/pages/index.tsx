import { useState } from "react";

const AdminPage = () => {
  const [selectedOption, setSelectedOption] = useState<string>("ifconfig");
  const [apiResponse, setApiResponse] = useState<string | null>(null);
  const [loading, setLoading] = useState<boolean>(false);

  const options = ["ifconfig", "ss -lnopt", "df / -h"];

  const handleApiRequest = async () => {
    setLoading(true);
    setApiResponse(null);

    try {
      const response = await fetch(`/api/task?query=${selectedOption}`);
      if (!response.ok) {
        throw new Error(`Error: ${response.statusText}`);
      }
      const data = await response.json();
      const output = data.output
      setApiResponse(output)
      // setApiResponse(JSON.stringify(data, null, 2));
    } catch (error: any) {
      setApiResponse(error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gray-100 flex flex-col items-center justify-center p-6">
      <div className="bg-white shadow-lg rounded-lg p-8 max-w-lg w-full">
        <h1 className="text-2xl font-bold text-gray-800 mb-6 text-center">
        Monitoring Panel
        </h1>

        {/* Dropdown */}
        <div className="mb-6">
          <label htmlFor="options" className="block text-gray-700 font-medium mb-2">
            Select a command:
          </label>
          <select
            id="options"
            value={selectedOption}
            onChange={(e) => setSelectedOption(e.target.value)}
            className="text-slate-700 w-full border-gray-300 rounded-lg shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
          >
            {options.map((option) => (
              <option key={option} value={option} >
                {option}
              </option>
            ))}
          </select>
        </div>

        {/* Button */}
        <button
          onClick={handleApiRequest}
          className="w-full bg-indigo-600 text-white font-semibold py-2 px-4 rounded-lg shadow-md hover:bg-indigo-700 transition duration-300"
          disabled={loading}
        >
          {loading ? "Sending Request..." : "Send Request"}
        </button>

        {/* Response Output */}
        <div className="mt-6">
          <h2 className="text-lg font-medium text-gray-800 mb-2">API Response:</h2>
          <div className="bg-gray-100 border border-gray-300 rounded-lg p-4 text-sm text-gray-700 overflow-auto max-h-64">
            {loading ? (
              <p>Loading...</p>
            ) : apiResponse ? (
              <pre>{apiResponse}</pre>
            ) : (
              <p>No response yet.</p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminPage;
