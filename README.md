

**<h1>Nashville Housing Price Prediction Project</h1>**

This project aims to predict housing prices in Nashville by analyzing a rich dataset of property information. The data is transformed and cleansed using SQL, allowing for insightful analysis of factors influencing property values.

<h3>Data Overview</h3>

The dataset includes the following attributes:

&emsp;•	UniqueID: A unique identifier for each record.</p>
&emsp;•	ParcelID: An identifier for the property parcel.</p>
&emsp;•	LandUse: Classification of land use (e.g., Single Family).</p>
&emsp;•	PropertyAddress: Physical address of the property.</p>
&emsp;•	SaleDate: Date when the property was sold.</p>
&emsp;•	SalePrice: Sale price of the property.</p>
&emsp;•	Owner Information: Details of the property owner.</p>
&emsp;•	Land and Building Values: Financial valuation of the land and building structures.</p>
&emsp;•	Property Features: Characteristics such as year built, number of bedrooms, and bathrooms.</p>


<h3>Overview of SQL Operations</h3></br>

1. Standardize Date Format</br>

![image](https://github.com/user-attachments/assets/8d4e5fcb-e79b-411f-b33e-d5a69dee9d5c)</br>

Purpose:- This step converts the SaleDate field to a standard date format. Standardizing date formats ensures consistency across the dataset, which is crucial for any time-based analysis, such as identifying trends over time.</br>


2. Populate Property Address Data</br>

![image](https://github.com/user-attachments/assets/427ec882-10e0-4ad9-8ae3-2e2d975207e0)</br>

Purpose:- This step fills in missing PropertyAddress data by leveraging other records with the same ParcelID. This ensures that all properties have complete address information, which is vital for location-based analysis.</br>


3. Breakout Address into Individual Columns (Address, City, State)</br>

![image](https://github.com/user-attachments/assets/1906d7f9-34f1-4991-8443-9372aae9dc68)</br>

Purpose:- By splitting PropertyAddress into separate fields for address, city, and state, the script facilitates detailed geographical analysis, allowing for city-specific insights and comparisons.</br>


4. Change Y and N to Yes and No in "Sold as Vacant" Field</br>

![image](https://github.com/user-attachments/assets/c2186b51-0c2f-4e19-8c17-4dd5c5341d12)</br>

Purpose:- This change makes the SoldAsVacant field more readable by converting 'Y' and 'N' to 'Yes' and 'No'. This enhances data interpretability for stakeholders who might not be familiar with the original abbreviations.</br>


5. Remove Duplicates</br>

![image](https://github.com/user-attachments/assets/c1531755-392a-4c28-a1a8-3d4d3282e50a)</br>

Purpose:- This section identifies duplicate entries within the dataset. Removing duplicates is essential for accurate statistical analysis, as duplicates can skew results and lead to incorrect insights.</br>


6. Delete Unused Columns</br>

![image](https://github.com/user-attachments/assets/29e8c8f7-ebfa-4521-82d3-60290f8fd7ca)</br>

Purpose:- Dropping unnecessary columns streamlines the dataset, focusing analysis on relevant variables that directly impact housing price predictions.</br>



<h3>Key Insights and Findings</h3>

1.	Market Trends:</br>

&emsp;•	An upward trend in property prices has been observed over the last decade. This is indicative of Nashville's growing real estate market, driven by factors such as population growth and urban development.</br>
&emsp;•	Properties sold in recent years tend to have higher prices, likely reflecting inflation and increased demand.</br>

2.	Impact of Property Age:</br>

&emsp;•	Properties built within the last 20 years command higher prices on average compared to older properties, suggesting a preference for newer constructions among buyers.</br>
&emsp;•	Older homes, while generally priced lower, show potential for investment opportunities given Nashville's historical significance and charm.</br>

3.	Geographical Influence:</br>

&emsp;•	Properties located in urban centers and affluent neighborhoods (e.g., Green Hills, Belle Meade) have significantly higher sale prices. This aligns with the desirability of these locations due to amenities, schools, and proximity to business hubs.</br>
&emsp;•	Conversely, properties in suburban or rural areas are more affordable, making them attractive options for first-time homebuyers or those seeking more space.</br>

4.	Influence of Property Features:</br>

&emsp;•	Larger properties with more bedrooms and bathrooms consistently achieve higher sale prices. This trend highlights the demand for spacious living, especially among families.</br>
&emsp;•	Acreage also plays a significant role, with larger plots of land increasing the overall property value.</br>

5.	Land vs. Building Value:</br>

&emsp;•	Analysis shows that the building's value significantly contributes to the total property value, especially in urban areas where land is scarce. In contrast, rural properties often have a higher land value percentage.</br>


<h3>Conclusion</h3>
The Nashville Housing Price Prediction Project successfully identifies and quantifies the factors influencing property prices. By leveraging SQL for data preparation and statistical analysis for insights, this project provides valuable guidance for prospective homebuyers, real estate professionals, and investors seeking to navigate Nashville's dynamic real estate market.


