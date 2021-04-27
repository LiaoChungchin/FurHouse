package org.iiiEDU.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.iiiEDU.model.Product;
import org.iiiEDU.model.ProductService;
import org.iiiEDU.utils.PathHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@EnableTransactionManagement
public class ProductController {

	@Autowired

	private ProductService productServiceImpl;
	
	/* spring don't new*/
	/* ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓*/
	@Autowired
	@Qualifier("product")
	private Product prod;
	
	//WebContent路徑
	private String originImagePath = PathHandler.globalProjectImgPath;

	//------------------------------前台------------------------------
	//查詢全部商品
	@GetMapping("/SelectAllProduct")
	public String ShowAll(Model model){
		List<Product> products = productServiceImpl.selectAllProduct();
		model.addAttribute("Products", products);// 設定所有產品的內容
		
		return "page-shopping.jsp";
	}
	
	//查詢一項商品
	@GetMapping("/SelectOneProduct")
	public String ShowOne(Model model,@RequestParam(required=false,name="SelectProductByID") Integer SelectProductByID){
		
		Product product = productServiceImpl.selectOneProduct(SelectProductByID);
		model.addAttribute("product", product);
		
		return "page-shopping-detail.jsp";
	}
	
	
	//------------------------------後台------------------------------
	//查詢全部商品
	@GetMapping("/SelectAllProduct_Root")
	public String SelectAllProductRoot(Model model){
		List<Product> prods = productServiceImpl.selectAllProduct();
		model.addAttribute("prods", prods);// 設定所有產品的內容
		
		return "root-page-products.jsp";
	}
	
	//查詢一項商品
	@GetMapping("/SelectOneProduct_Root")
	public String SelectOneProductRoot(Model model,@RequestParam(required=false,name="SelectProductByID") Integer SelectProductByID){
		
		Product prod = productServiceImpl.selectOneProduct(SelectProductByID);
		model.addAttribute("prod", prod);
		
		return "root-page-products.jsp";
	}
	
	//導向新增商品頁面
	@GetMapping("/goInsertProduct")
	public String goInsertProduct(){
		return "root-page-products-insert.jsp";
	}
	
	//新增商品
	@PostMapping("/InsertProduct_Root")
	public String InsertProductRoot(Model model
		,@RequestParam(name="type")String type
		,@RequestParam(name="subType")String subType
		,@RequestParam(name="brandName")String brandName
		,@RequestParam(name="productName")String productName
		,@RequestParam(required=false,defaultValue = "0",name="price")Integer price
		,@RequestParam(required=false,defaultValue = "0",name="quantity")Integer quantity
		,@RequestParam(required=false,defaultValue = "0",name="stock")Integer stock
		,@RequestParam(name="place")String place
		,@RequestParam(required=false,name="comment1")String comment1
		,@RequestParam(required=false,name="comment2")String comment2
		,@RequestParam(name="file1")MultipartFile file1
		,@RequestParam(required=false,name="file2")MultipartFile file2
		,@RequestParam(required=false,name="file3")MultipartFile file3
		){
		
		//-----------setProductBean
		
		prod.setType(type);
		prod.setSubType(subType);
		prod.setBrandName(brandName);
		prod.setProductName(productName);
		
		//數字欄位為負值/任一不可為空值欄位為空值或空字串時的錯誤處理
		if(type.isEmpty()||subType.isEmpty()||brandName.isEmpty()||productName.isEmpty()||place.isEmpty()) {
			return "root-page-products-error.jsp";
		}
		
		if(price!=null && price>=0) {
			prod.setPrice(price);
		}else {
			return "root-page-products-error.jsp";
		}
		
		if(quantity!=null && quantity>=0) {
			prod.setQuantity(quantity);
		}else {
			return "root-page-products-error.jsp";
		}
		
		if(stock!=null && stock>=0) {
			prod.setStock(stock);
		}else {
			return "root-page-products-error.jsp";
		}
		
		prod.setPlace(place);
		prod.setComment1(comment1);
		prod.setComment2(comment2);
		
		prod.setShelf(1); // shelf 暫時寫死
		
		// 配合資料庫時間做轉換
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();

		java.sql.Timestamp ts = java.sql.Timestamp.valueOf(sdf.format(date));
		System.out.println(ts);
		prod.setUpdateDate(ts);

		
		// -------------圖片1--------------
		if(file1.getSize()!=0) {
			try {						
				UUID uniquestr = UUID.randomUUID();
				String tempstr = "/Products/Product"+uniquestr+".jpg";
				File savefile = new File(originImagePath+tempstr);
				
			/*
				InputStream in = file1.getInputStream();
				OutputStream out = new FileOutputStream(savefile);
				byte[] buf = new byte[1024];
				int length;
				while ((length = in.read(buf)) != -1)
					out.write(buf, 0, length);
				in.close();
				out.close();
			*/		
			/*  這句 ↓ 作用同上面那段註解內容，下同*/
				file1.transferTo(savefile); 
				
				prod.setPhoto1("/assets/img" + tempstr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			prod.setPhoto1(null);
		}
		// -------------圖片2--------------
		if(file2.getSize()!=0) {
			try {						
				UUID uniquestr = UUID.randomUUID();
				String tempstr = "/Products/Product"+uniquestr+".jpg";
				File savefile = new File(originImagePath+tempstr);
	
				file2.transferTo(savefile);
				prod.setPhoto2("/assets/img" + tempstr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			prod.setPhoto2(null);
		}
		// -------------圖片3--------------
		if(file3.getSize()!=0) {
			try {						
				UUID uniquestr = UUID.randomUUID();
				String tempstr = "/Products/Product"+uniquestr+".jpg";
				File savefile = new File(originImagePath+tempstr);
	
				file3.transferTo(savefile);
				prod.setPhoto3("/assets/img" + tempstr);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			prod.setPhoto3(null);
		}
		//-------------------圖片部分結束-------------------
		
		try {
			productServiceImpl.insertProduct(prod);
		} catch (Exception e) {
			e.printStackTrace();
			return "root-page-products-error.jsp";
		}	
		return "redirect:/SelectAllProduct_Root";

	}
	
	//導向修改商品頁面
	@GetMapping("/SetProduct_Root")
	public String SetProductRoot(Model model,@RequestParam(required=false,name="SetProductByID") Integer SetProductByID){
		
		Product prod = productServiceImpl.selectOneProduct(SetProductByID);
		model.addAttribute("prod", prod);
		
		return "root-page-products-set.jsp";
	}
	
	//修改商品
	@PostMapping("/UpdateProduct_Root")
	public String UpdateProductRoot(Model model
		,@RequestParam(name="id")Integer id
		,@RequestParam(name="type")String type
		,@RequestParam(name="subType")String subType
		,@RequestParam(name="brandName")String brandName
		,@RequestParam(name="productName")String productName
		,@RequestParam(required=false,defaultValue = "0",name="price")Integer price
		,@RequestParam(required=false,defaultValue = "0",name="quantity")Integer quantity
		,@RequestParam(required=false,defaultValue = "0",name="stock")Integer stock
		,@RequestParam(name="place")String place
		,@RequestParam(required=false,name="comment1")String comment1
		,@RequestParam(required=false,name="comment2")String comment2
		,@RequestParam(name="file1")MultipartFile file1
		,@RequestParam(required=false,name="file2")MultipartFile file2
		,@RequestParam(required=false,name="file3")MultipartFile file3
		){		
		
		/* 找到該id的物件，為了使用者沒有更新圖片，填入之前的圖片路徑*/
		/* ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓*/
		Product findprod = productServiceImpl.selectOneProduct(id);
		
		//---------------設定產品----------------
		prod.setId(id);
		prod.setType(type);
		prod.setSubType(subType);
		prod.setBrandName(brandName);
		prod.setProductName(productName);
		
		//數字欄位為負值/任一不可為空值欄位為空值或空字串時的錯誤處理
		if(type.isEmpty()||subType.isEmpty()||brandName.isEmpty()||productName.isEmpty()||place.isEmpty()) {
			return "root-page-products-error.jsp";
		}
		
		if(price!=null && price>=0) {
			prod.setPrice(price);
		}else {
			return "root-page-products-error.jsp";
		}
		
		if(quantity!=null && quantity>=0) {
			prod.setQuantity(quantity);
		}else {
			return "root-page-products-error.jsp";
		}
		
		if(stock!=null && stock>=0) {
			prod.setStock(stock);
		}else {
			return "root-page-products-error.jsp";
		}
		
		prod.setPlace(place);
		prod.setComment1(comment1);
		prod.setComment2(comment2);
		
		prod.setShelf(1); // shelf 暫時寫死
		
		//----配合資料庫時間做轉換（設定更新時間）----
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();

		java.sql.Timestamp ts = java.sql.Timestamp.valueOf(sdf.format(date));
		System.out.println(ts);
		
		prod.setUpdateDate(ts);
		
		// -------------覆寫圖片1--------------
		
		/* 更新圖片須加判斷式*/
		/* ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓*/
		if(file1.getSize()!=0) {
			try {						
				UUID uniquestr = UUID.randomUUID();
				String tempstr = "/Products/Product"+uniquestr+".jpg";				
				File savefile = new File(originImagePath+tempstr);
						
				file1.transferTo(savefile);
				prod.setPhoto1("/assets/img" + tempstr);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			/*填入之前的圖片路徑*/
			/* ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓*/
			prod.setPhoto1(findprod.getPhoto1());
		}
		
		// -------------覆寫圖片2--------------
		
		/*以下重覆*/
		/* ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓*/
		if(file2.getSize()!=0) {
			try {						
				UUID uniquestr = UUID.randomUUID();
				String tempstr = "/Products/Product"+uniquestr+".jpg";
				File savefile = new File(originImagePath+tempstr);

				file2.transferTo(savefile);
				prod.setPhoto2("/assets/img" + tempstr);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			prod.setPhoto2(findprod.getPhoto2());
		}
		// -------------覆寫圖片3--------------
		if(file3.getSize()!=0) {
			try {						
				UUID uniquestr = UUID.randomUUID();
				String tempstr = "/Products/Product"+uniquestr+".jpg";
				File savefile = new File(originImagePath+tempstr);
			
				file3.transferTo(savefile);
				prod.setPhoto3("/assets/img" + tempstr);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			prod.setPhoto3(findprod.getPhoto3());
		}
		
		//-------------------圖片部分結束-------------------
		
		try {
			productServiceImpl.updateProduct(prod);
		} catch (Exception e) {
			e.printStackTrace();
			return "root-page-products-error.jsp";
		}
		return "redirect:/SelectAllProduct_Root";

	}

	//刪除商品
	@GetMapping("/DeleteProduct_Root")
	public String deleteProductRoot(Model model,@RequestParam(required=false,name="DeleteProductByID") Integer DeleteProductByID) {
				
		try {
			productServiceImpl.deleteProduct(DeleteProductByID);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return "redirect:/SelectAllProduct_Root";
	}	
	
}
