// src/api/store/uploads/route.ts
import { MedusaRequest, MedusaResponse } from "@medusajs/framework/http";
import { uploadFilesWorkflow } from "@medusajs/medusa/core-flows";

export const POST = async (req: MedusaRequest, res: MedusaResponse) => {
    const files = (req.files as Express.Multer.File[]) || [];

    console.log("Upload Request Received. Files count:", files.length);

    if (files.length === 0) {
        console.warn("No files found in request. Check 'files' key in form-data.");
        return res.status(400).json({ message: "No files uploaded" });
    }

    // Pastikan Anda sudah mengonfigurasi File Service (S3, DigitalOcean, atau Local)
    const { result } = await uploadFilesWorkflow(req.scope).run({
        input: {
            files: files.map((f) => ({
                filename: f.originalname,
                mimeType: f.mimetype,
                content: f.buffer.toString("base64"),
                access: "public",
            })),
        },
    });

    res.json({ uploads: result });
};
