
/*										Cleaning data in SQL
*/


select * from HousingData;

--------------------------------------------------------------------------------------------------------------------------

-----Standardize Date Format


select SaleDate, convert(Date,SaleDate) from HousingData;

update HousingData set SaleDate = convert(Date,SaleDate);

--------------------------------------------------------------------------------------------------------------------------

-----Populate Property Address data


select * from HousingData 
--where PropertyAddress is null
order by ParcelID;

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress,isnull(a.PropertyAddress,b.PropertyAddress)
from HousingData a
join HousingData b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null;

update a
set PropertyAddress = isnull(a.PropertyAddress,b.PropertyAddress)
from HousingData a
join HousingData b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null;

--------------------------------------------------------------------------------------------------------------------------

-----Breaking out Address into Individual Columns (Address, City, State)


select PropertyAddress from HousingData;

select
substring(PropertyAddress, 1, charindex(',', PropertyAddress) -1 ) as Address,
substring(PropertyAddress, charindex(',', PropertyAddress) + 1 , len(PropertyAddress)) as Address
from HousingData;

alter table HousingData
add SplitAddress nvarchar(255);
update HousingData
set SplitAddress = substring(PropertyAddress, 1, charindex(',', PropertyAddress) -1 );


alter table HousingData
add SplitCity nvarchar(255);
update HousingData
set SplitCity = substring(PropertyAddress, charindex(',', PropertyAddress) + 1 , len(PropertyAddress));

select * from HousingData;


select OwnerAddress from HousingData;

Select
parsename(replace(OwnerAddress, ',', '.') , 3),
parsename(replace(OwnerAddress, ',', '.') , 2),
parsename(replace(OwnerAddress, ',', '.') , 1)
from HousingData;

alter table HousingData
add OwnerSplitAddress nvarchar(255);
update HousingData
set OwnerSplitAddress = parsename(replace(OwnerAddress, ',', '.') , 3);

alter table HousingData
add OwnerSplitCity nvarchar(255);
update HousingData
set OwnerSplitCity = parsename(replace(OwnerAddress, ',', '.') , 2);

alter table HousingData
add OwnerSplitState nvarchar(255);
update HousingData
set OwnerSplitState = parsename(replace(OwnerAddress, ',', '.') , 1);

select * from HousingData;

--------------------------------------------------------------------------------------------------------------------------

-----Change Y and N to Yes and No in "Sold as Vacant" field


select distinct(SoldAsVacant), count(SoldAsVacant)
from HousingData
group by SoldAsVacant
order by 2;


select SoldAsVacant, 
case when SoldAsVacant = 'Y' THEN 'Yes'
	   when SoldAsVacant = 'N' THEN 'No'
	   else SoldAsVacant
	 end
from HousingData;


update HousingData
set SoldAsVacant = case when SoldAsVacant = 'Y' THEN 'Yes'
	   when SoldAsVacant = 'N' THEN 'No'
	   else SoldAsVacant
	 end

--------------------------------------------------------------------------------------------------------------------------

-----Remove Duplicates


with RowNumCTE as(
select *,
	row_number() over (
	partition by ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 order by
					UniqueID
					) row_num

from HousingData
)
select *
from RowNumCTE
where row_num > 1
order by PropertyAddress;

--------------------------------------------------------------------------------------------------------------------------

-----Delete Unused Columns


select * from HousingData;


alter table HousingData
drop column OwnerAddress, TaxDistrict, PropertyAddress, SaleDate;
