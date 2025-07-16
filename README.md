# bank-customer-segmentation-ml

End-to-end customer segmentation project in banking using SQL, Python (Pandas, Scikit-Learn, PCA, KMeans), and Tkinter GUI. Real-world demo of data cleaning, clustering, and business-driven segment labeling.

# 🏦 Customer Segmentation using K-Means Clustering

This project demonstrates a full end-to-end pipeline for customer segmentation using K-Means clustering. The workflow includes data import from SQL, cleaning and preprocessing, applying dimensionality reduction (PCA), clustering using K-Means, and building a modern GUI for real-time prediction.

---

## 📊 Project Summary

Banks deal with thousands of customers, each with different characteristics. Instead of treating every customer the same, this project identifies distinct customer groups (clusters) based on their attributes to help design targeted marketing strategies.

---

## ⚙️ Technologies Used

- **SQL**: For data schema, cleaning, and basic feature engineering  
- **Python (Pandas, NumPy, Sklearn)**: For preprocessing, PCA, and KMeans  
- **Matplotlib/Seaborn**: For visualization  
- **Tkinter**: For building a modern, dark-themed GUI interface  

---

## 🗃️ 1. Database Schema

The dataset is stored in a MySQL-compatible schema:

```sql
CREATE TABLE bank_customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
	age INT,
	job VARCHAR(50),
	marital VARCHAR(20),
	education VARCHAR(30),
	default_status VARCHAR(10),
	balance INT,
	housing VARCHAR(10),
	loan VARCHAR(10),
	contact VARCHAR(10),
	day INT,
	month VARCHAR(10),
	duration INT,
	campaign INT,
	pdays INT,
	previous INT,
	poutcome VARCHAR(20),
	deposit VARCHAR(10)
);
