package com.example.dao

import kotlinx.coroutines.Dispatchers
import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import java.sql.ResultSet


object DatabaseFactory {
    private lateinit var database: Database
    fun init() {
        try {
            database = Database.connect(
                url = "jdbc:mysql://localhost:3306/ht_diemdanh",
                driver = "com.mysql.cj.jdbc.Driver",
                user = "root",
                password = "123456"
            )
        } catch (e: Exception) {
            println("Database connection: " + "Lỗi kết nối")
        }
    }

    suspend fun dbQuery(queryCommand: String) =
        newSuspendedTransaction(
            Dispatchers.IO,
            db = database
        ) {
            val resultSetTransform: MutableList<Map<String, Any?>> = ArrayList()

            exec(queryCommand) {
                val rsmd = it.metaData
                val col = rsmd.columnCount

                while (it.next()) {
                    val row: MutableMap<String, Any?> = HashMap()
                    for (i in 1..col) {
                        row.put(rsmd.getColumnLabel(i).toLowerCase(), it.getObject(i) ?: null)
                    }
                    resultSetTransform.add(row)
                }
                resultSetTransform// resultset of exec() method is not null
            } ?: resultSetTransform // return resulset transform empty
        }

    suspend fun dbUpdate(queryCommand: String) =
        newSuspendedTransaction(
            Dispatchers.IO,
            db = database
        ) {
            val row: MutableMap<String, Any?> = HashMap()

            exec(queryCommand) {
                val rsmd = it.metaData
                while (it.next()) {
                    val col = rsmd.columnCount
                    for (i in 1..col) {
                        row.put(rsmd.getColumnLabel(i).toLowerCase(), it.getObject(i) ?: null)
                    }
                }
                row
            } ?: row
        }

    suspend fun dbQuery1(queryCommand: String, block: (ResultSet) -> Unit) =
        newSuspendedTransaction(
            Dispatchers.IO,
            db = database
        ) {
            connection.prepareStatement(queryCommand, false).executeQuery().let {
                val resultSetTransform: List<Map<String, Any>> = ArrayList()
                val rsmd = it.metaData
                val col = rsmd.columnCount
                while (it.next()) {
                    val row: MutableMap<String, Any> = HashMap()
                    for (i in 1..col) {
                        row[rsmd.getColumnLabel(i)] = it.getObject(i)
                    }
                    resultSetTransform.toMutableList().add(row)
                    println("Có tồn tại")
//                    println("${it.getObject("TENLOP")}")
//                    println("${it.getObject("TENLOP")::class.simpleName}")
//                    println("${rs.getString("TENLOP")}")
//                        println("Kết quả nè "+"${it.row}")
//                        println("Kết quả nè "+"${it.fetchSize}")
                }


            }

        }

//    suspend fun <T> dbQuery2(queryCommand: String, block: suspend (List<Map<String, Any>>) -> T): T? =
//        newSuspendedTransaction(
//            Dispatchers.IO,
//            db = database
//        ) {
//            connection.prepareStatement(queryCommand, false).executeQuery().let {
//                val resultSetTransform: MutableList<Map<String, Any>> = ArrayList()
//                val rsmd = it.metaData
//                val col = rsmd.columnCount
//                while (it.next()) {
//                    val row: MutableMap<String, Any> = HashMap()
//                    for (i in 1..col) {
//                        row.put(rsmd.getColumnLabel(i).lowercase(Locale.getDefault()), it.getObject(i))
////                        println("Key: ${rsmd.getColumnLabel(i)}, Value: ${row[rsmd.getColumnLabel(i)]}")
////                        println("Kiểu Object: ${it.getObject(i)::class.simpleName}")
//                    }
//
//
//                    resultSetTransform.add(row)
//                }
//                block(resultSetTransform)
//            }
//
//        }

//    suspend fun dbQuery(queryCommand: String)=
//        newSuspendedTransaction(
//            Dispatchers.IO,
//            db = database
//        ) {
//            exec(queryCommand){
//                val resultSetTransform: MutableList<Map<String, Any>> = ArrayList()
//                val rsmd = it.metaData
//                val col = rsmd.columnCount
//                while (it.next()) {
//                    val row: MutableMap<String, Any> = HashMap()
//                    for (i in 1..col) {
//                        row.put(rsmd.getColumnLabel(i).toLowerCase(), it.getObject(i))
//                        println("Key: ${rsmd.getColumnLabel(i)}, Value: ${row[rsmd.getColumnLabel(i)]}")
//                        println("Kiểu Object: ${it.getObject(i)::class.simpleName}")
//                    }
//
////                    resultSetTransform.add(row)
//                }
////                block(resultSetTransform)
//            }
//
//        }
}
