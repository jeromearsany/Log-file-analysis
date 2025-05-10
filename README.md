# Log File Analysis Project

This project analyzes a web server access log file using a Bash script to extract key metrics, detect failures, and identify usage patterns. It was developed on Kali Linux as part of an information security management course.

---

## 📂 Files Included

- `log_analysis.sh` – Bash script that processes the log file and generates output statistics  
- `access.log` – Sample Apache log file (from Elastic GitHub repository)  
- `report.pdf` / `log_analysis_report.docx` – Report explaining the process, findings, and suggestions

---

## 🛠 Requirements

- Bash (on Linux or WSL)
- `awk`, `grep`, `sort`, `uniq` – All standard tools available in Kali Linux

---

## ▶️ How to Run

1. Open a Terminal in the project directory  
2. Ensure the script is executable:
   ```bash
   chmod +x log_analysis.sh
   ```
3. Run the script:
   ```bash
   ./log_analysis.sh
   ```

To save the output to a file:
```bash
./log_analysis.sh > analysis_results.txt
```

---

## 📊 What the Script Does

- Counts total, GET, and POST requests  
- Identifies all unique IPs and how many GET/POST requests each made  
- Calculates number and percentage of failed requests (4xx/5xx)  
- Identifies the most active IP address  
- Computes average number of requests per day  
- Shows failure requests per day  
- Displays number of requests per hour  
- Breaks down status codes (e.g., 200, 404, 500)  
- Finds top IPs using GET or POST  
- Detects failure patterns by hour

---

## 🔍 Sample Log File Source

Sample log downloaded from:  
[https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs](https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs)

---

## 📘 Author

[Your Name]  
Course: [Course Name] – May 2025

---

## 📄 License

This project is for educational and academic use only.

---

## 📊 What the Script Does

- Counts total requests, GET requests, and POST requests  
- Identifies all unique IP addresses and their request types  
- Calculates number and percentage of failed requests (4xx and 5xx)  
- Identifies the most active IP address  
- Calculates average requests per day  
- Lists days with the most failed requests  
- Shows number of requests per hour  
- Provides a status code breakdown (e.g., 200, 404, 500)  
- Finds which IP made the most GET or POST requests  
- Detects patterns in failed requests by hour

---

## 🔍 Sample Log File Source

Sample log file used in this project:  
[https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs](https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs)

---

## 📘 Author

Jerome Arsany

Course: Information Security Management – May 2025

---

## 📄 License

This project is for educational and academic use only.
```
