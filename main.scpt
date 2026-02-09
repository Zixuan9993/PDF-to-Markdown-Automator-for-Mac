-- Set basic variables
-- IMPORTANT: Users must update this path to point to their local OCR_pdf.sh file
property shellScriptPath : ".../OCR_pdf.sh"

-- Main execution block when the script is run directly (e.g., double-clicked)
on run
	try
		-- Show file selection dialog
		set pdfFile to choose file with prompt "Please select a PDF file to process:" of type {"PDF"} default location (path to desktop)
		
		-- Get the POSIX path of the selected PDF file and quote it for shell safety
		set pdfPath to quoted form of POSIX path of pdfFile
		
		-- Check if the shell script exists at the specified path
		set shellScript to POSIX file shellScriptPath
		try
			tell application "Finder"
				if exists shellScript as alias then
					-- Script found, proceed with processing
					-- Show a system notification that processing has started
					display notification "Starting PDF processing..." with title "PDF OCR"
					
					-- Execute the script within the Terminal application
					tell application "Terminal"
						activate
						-- Run the shell script and pass the PDF path as an argument
						do script (quoted form of shellScriptPath & " " & pdfPath)
					end tell
				else
					-- Handle missing script error
					display dialog "Processing script not found! Please ensure the file exists at: " & shellScriptPath buttons {"OK"} default button "OK" with icon stop
					return
				end if
			end tell
		on error
			-- Handle permission or access errors
			display dialog "Unable to access the script file! Please check file permissions." buttons {"OK"} default button "OK" with icon stop
			return
		end try
		
	on error errMsg
		-- General error handling
		display dialog "An error occurred during processing: " & errMsg buttons {"OK"} default button "OK" with icon stop
	end try
end run

-- Drag-and-drop handler
on open dropped_items
	repeat with pdfFile in dropped_items
		-- Validate that the dropped item is a PDF file
		set fileExt to name extension of (info for pdfFile)
		if fileExt is not "pdf" then
			display dialog "Please only drop PDF files!" buttons {"OK"} default button "OK" with icon stop
			return
		end if
		
		-- Get the POSIX path of the dropped PDF file
		set pdfPath to quoted form of POSIX path of pdfFile
		
		-- Verify shell script existence before execution
		set shellScript to POSIX file shellScriptPath
		try
			tell application "Finder"
				if exists shellScript as alias then
					-- Bring Terminal to the front and execute the processing logic
					tell application "Terminal"
						activate
						do script (quoted form of shellScriptPath & " " & pdfPath)
					end tell
				else
					display dialog "Processing script not found! Please ensure the file exists at: " & shellScriptPath buttons {"OK"} default button "OK" with icon stop
					return
				end if
			end tell
		on error
			display dialog "Unable to access the script file! Please check file permissions." buttons {"OK"} default button "OK" with icon stop
			return
		end try
	end repeat
end open