Setting.create!([
 {group: "user_name", key: "1234", value: "Arcara", note: "", status: nil},
 {group: "user_name", key: "5678", value: "Carbonelli", note: "", status: nil},
 {group: "user_name", key: "9012", value: "Errico", note: "", status: nil},
 {group: "user_name", key: "3456", value: "Corcione", note: "", status: nil},
 {group: "user_name", key: "7890", value: "Stanziani", note: "", status: nil},
 {group: "user_name", key: "1235", value: "Domesi", note: "", status: nil},
 {group: "user_name", key: "6789", value: "Cecchetti", note: "", status: nil},
 {group: "user_name", key: "0123", value: "Scarca", note: "", status: nil},
 {group: "user_name", key: "4567", value: "Tabacchini", note: "", status: nil},
 {group: "user_name", key: "8901", value: "Toros", note: "", status: nil},
 {group: "user_name", key: "2345", value: "De Simone", note: "", status: nil},
 {group: "user_name", key: "6789", value: "Mazzaroni", note: "", status: nil},
 {group: "user_name", key: "0145", value: "Meo", note: "", status: nil},
 {group: "user_name", key: "9876", value: "Corona", note: "", status: nil},
 {group: "user_name", key: "7654", value: "Lamanna", note: "", status: nil},
 {group: "user_name", key: "3210", value: "Silvestri", note: "", status: nil},
 {group: "user_name", key: "5432", value: "Ferranti", note: "", status: nil},
 {group: "user_name", key: "9888", value: "Evangelisti", note: "", status: nil},
 {group: "user_name", key: "5432", value: "Brunori", note: "", status: nil},
 {group: "user_name", key: "1122", value: "Vio", note: "", status: nil},
 {group: "user_name", key: "3344", value: "Marchitto", note: "", status: nil},
 {group: "user_name", key: "9999", value: "De Luca", note: "", status: nil},
 {group: "ips", key: "10.101.142.168", value: "Arcara", note: "", status: nil},
 {group: "ips", key: "10.101.142.167", value: "Carbonelli", note: "", status: nil}
])

User.create!([
 {fullName:"Trinh Ngoc Tien", department:"Tech Dept", position:"Administrator", 
 	email:"tientn@absoft.com.vn",password:"12345678", password_confirmation: "12345678",
 	activeKey:"",status:1, salt:"AvTfD"}
])

PresetCategory.create!([
    {title: "Children", status:1},
    {title: "Space", status:2}
])