from PyPDF2 import PdfMerger
import os

def combine_pdfs(pdf_list, output_filename):
    merger = PdfMerger()
    for pdf in pdf_list:
        if os.path.exists(pdf):
            merger.append(pdf)
            print(f"Added: {pdf}")
        else:
            print(f"File not found: {pdf}")
    merger.write(output_filename)
    merger.close()
    print(f"\n✅ Combined PDF saved as: {output_filename}")

if __name__ == "__main__":
    # Example: list of PDF files to merge (in order)
    pdf_files = [
        "D:\Desktop\EvKDocx\Academic\One Basin CRC\OneBasinCRCPhDProgram.pdf",
        "D:\Desktop\EvKDocx\Academic\One Basin CRC\EvaristeM.Resume.Sept.2025.pdf",
        "D:\Desktop\EvKDocx\Academic\One Basin CRC\MSc AQE Degree.pdf"
        "D:\Desktop\EvKDocx\Academic\One Basin CRC\MSc AQE Transcript.pdf"]
    
    # Output file name
    output_file = "combined_output.pdf"
    
    combine_pdfs(pdf_files, output_file)


#===========================================================================================
import tabula
import pandas as pd

# Extract tables
tables = tabula.read_pdf("PSTA5.pdf",  pages=5)

# Save first table to Excel
tables[0].to_excel("PSTA5.xlsx", index=False)