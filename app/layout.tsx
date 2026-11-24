import type { Metadata } from "next";
import SocBackground from "@/components/SocBackground";
import "./globals.css";

export const metadata: Metadata = {
  title: "Republic Airways MOC Appreciation Gifts",
  description: "Maintenance Operation Control appreciation gift ordering for Republic Airways",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className="antialiased">
        {/* Reusing the SOC backdrop video until a MOC-specific asset is provided. */}
        <SocBackground />
        {children}
      </body>
    </html>
  );
}
