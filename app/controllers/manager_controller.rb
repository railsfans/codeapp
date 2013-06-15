class ManagerController < ApplicationController

def fillvalue
flag = false
@code=Code.where(:code=>params[:id])
if !@code.empty?
flag = true
end
respond_to do |format|
	format.json { render :json=>{:success=>flag, :data=> @code}}
end
end

def all
@repository=Code.where(:codeLength=>true)
respond_to do |format|
      format.html # index.html.erb
#     format.json { render json: { :totalCount=>@repository.count, :gridData=> @repository.collect{|list| :id=>list.id, :quantity=>list.quantity, :name=>list.name, :partNum=>list.partNum, :unitprice=>list.unitprice, :totalprice=>(list.quantity.to_i)*(list.unitprice.to_f), :comment=>list.comment, :code=>list.code, :comment=>list.comment, :manufacturer=>list.manufacturer, :suppliers=>list.suppliers.empty? ? '' : collect(&:company).join(','), :footprint=>list.footprint } } }
      format.json { render json: { :totalCount=>@repository.count, :gridData=> @repository.collect{ |list| {:id=>list.id, :quantity=>list.quantity.nil? ? '' :list.quantity, :name=>list.name.nil? ? '' :list.name, :partNum=>list.partNum.nil? ? '' :list.partNum, :unitprice=>list.unitprice.nil? ? '' :list.unitprice, :totalprice=>(list.quantity.to_i)*(list.unitprice.to_f), :comment=>list.comment.nil? ? '' :list.comment, :code=>list.code, :comment=>list.comment.nil? ? '' :list.comment, :manufacturer=>list.manufacturer.nil? ? '' :list.manufacturer, :suppliers=>list.suppliers.empty? ? '' : list.suppliers.collect(&:company).join(','), :footprint=>list.footprint.nil? ? '' :list.footprint} } } }
      format.js
    end
end

def suppliers
@suppliers=Supplier.all
respond_to do |format|
format.json { render json: { :gridData=> @suppliers.collect{ |list| { :id=>list.id, :company=>list.company } }} }
end
end

def material_add
flag=false
Code.where(:codeLength=>true).each do |c|
	if c.code==params[:code]
	flag=true
	@code=c
	@id=c.id
#	codeId=c.id
end
end
params[:suppliers].each do |i|
	p i[1]
	p @id
#	p Supplier.where(:company=>i[1]).id
  p @b=Supplier.where(:company=>i[1]).first.try(:id)
  Menbership.create(:code_id=>@id, :supplier_id=>@b)
end
p params[:suppliers].length
#p codeId
if flag
#@code = Code.find(codeId)
@code.update_attributes(:name=>params[:name],:unitprice=>params[:unitprice], :quantity=>params[:quantity],:comment=>params[:comment], :footprint=>params[:footprint], :manufacturer=>params[:manufacturer], :partNum=>params[:partNum])
end
  respond_to do |format|
  	format.json { render :json=>{:success=>flag} }
  end
end

def material_edit
#flag=true
#Code.where(:codeLength=>true).each do |c|
#	if c.code==params[:code]
#	flag=false
#end
#end
#if flag
@code = Code.find(params[:id])
@code.update_attributes(:name=>params[:name],:unitprice=>params[:unitprice], :quantity=>params[:quantity],:comment=>params[:comment], :footprint=>params[:footprint], :manufacturer=>params[:manufacturer], :partNum=>params[:partNum] )
#end
 respond_to do |format|
	format.json { render :json=>{:success=>true}}
end
end

def material_delete
#flag=true
#Code.where(:codeLength=>true).each do |c|
#	if c.code==params[:code]
#	flag=false
#end
#end
#if flag
@code = Code.find(params[:id])
@code.delete
#end
 respond_to do |format|
	format.json { render :json=>{:success=>true}}
end
end

end
