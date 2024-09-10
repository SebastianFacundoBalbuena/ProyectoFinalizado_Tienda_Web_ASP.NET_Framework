<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InicioClientes.aspx.cs" Inherits="WebApplication.InicioClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Carrusel Modernizado con Imágenes de Electrodomésticos -->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img style="height: 400px" src="https://noticias.bidcom.com.ar/wp-content/uploads/2022/02/parlante-bluetooth-3.jpg" class="d-block w-100" alt="Electrodoméstico 1">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Todo lo que necesitas para tu  día a  día</h3>
                    <p>Encuentra los mejores electrodomésticos para tu hogar.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img style="height: 400px" src="https://www.ocu.org/-/media/ocu/images/home/tecnologia/telefono/cuanto%20debe%20durar%20un%20movil/telefono_duracion_800x450.jpg?rev=89d0b8bb-218b-4b11-9730-71effc5df549&mw=660&hash=CFAA6CFD4464F3C071C7F787C3133438" class="d-block w-100" alt="Electrodoméstico 2">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Electrodomésticos Modernos</h3>
                    <p>Descubre electrodomésticos modernos y eficientes.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img style="height: 400px" src="https://anged.es/wp-content/uploads/2022/03/shutterstock_1445581070.jpg" class="d-block w-100" alt="Electrodoméstico 3">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Electrodomésticos para el Hogar</h3>
                    <p>Productos diseñados para mejorar tu vida diaria.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Card Principal -->
    <div class="card text-center shadow-lg rounded" style="margin-top: 20px;">
        <div class="card-header bg-primary text-white">
            ¡Inicia sesión para acceder a la lista de Stock!
        </div>
        <div class="card-body">
            <h5 class="card-title">New Origin</h5>
            <p class="card-text">¡Conoce ya mismo los productos disponibles en nuestra tienda!</p>
            <asp:Button CssClass="btn btn-outline-primary me-2" Text="Productos disponibles" runat="server" ID="IrAProductos" OnClick="IrAProductos_Click" />
            <asp:Button CssClass="btn btn-outline-secondary" Text="Registrarse" runat="server" ID="botonRegistarse" OnClick="botonRegistarse_Click" />
        </div>
        <div class="card-footer text-muted">
            Quilmes - Provincia de Bs As.
        </div>
    </div>

    <!-- Sección de Ofertas Destacadas -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Ofertas Destacadas</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="https://img.freepik.com/vector-gratis/fondo-moderno-oferta-ultima-hora-publicidad-minorista_1017-45032.jpg" class="card-img-top" alt="Oferta 1">
                    <div class="card-body">
                        <h5 class="card-title">Oferta Especial 1</h5>
                        <p class="card-text">Aprovecha esta oferta en productos de alta calidad.</p>
                        <a href="#" class="btn btn-primary">Ver Oferta</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://img.freepik.com/vector-gratis/fondo-moderno-oferta-ultima-hora-publicidad-minorista_1017-45032.jpg" class="card-img-top" alt="Oferta 2">
                    <div class="card-body">
                        <h5 class="card-title">Oferta Especial 2</h5>
                        <p class="card-text">Descuentos en una variedad de electrodomésticos.</p>
                        <a href="#" class="btn btn-primary">Ver Oferta</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://img.freepik.com/vector-gratis/fondo-moderno-oferta-ultima-hora-publicidad-minorista_1017-45032.jpg" class="card-img-top" alt="Oferta 3">
                    <div class="card-body">
                        <h5 class="card-title">Oferta Especial 3</h5>
                        <p class="card-text">Consigue productos a precios reducidos.</p>
                        <a href="#" class="btn btn-primary">Ver Oferta</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sección de Categorías Populares -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Categorías Populares</h2>
        <div class="row">
            <div class="col-md-3">
                <div class="card" style="height: 340px">
                    <img style="height: 180px" src="https://www.sams.com.mx/images/banner-images/escaparates/escaparate-celulares-220509.png" class="card-img-top" alt="Categoría 1">
                    <div class="card-body">
                        <h5 class="card-title">Celulares</h5>
                        <p class="card-text">Conectate al mundo.</p>
                        <asp:Button class="btn btn-secondary" Text="Ver categoria" runat="server" ID="btnCelulares" OnClick="btnCelulares_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card" style="height: 340px">
                    <img style="height: 180px" src="https://http2.mlstatic.com/D_NQ_NP_637703-MLU70045322176_062023-O.webp" class="card-img-top" alt="Categoría 2">
                    <div class="card-body">
                        <h5 class="card-title">Audio</h5>
                        <p class="card-text">Segui tu propio ritmo.</p>
                        <asp:Button class="btn btn-secondary" Text="Ver categoria" runat="server" ID="btnAudio" OnClick="btnAudio_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card" style="height: 340px">
                    <img style="height: 180px" src="https://resizer.iproimg.com/unsafe/1280x/filters:format(webp)/assets.iproup.com/assets/jpg/2023/07/35598.jpg" class="card-img-top" alt="Categoría 3">
                    <div class="card-body">
                        <h5 class="card-title">Televisores</h5>
                        <p class="card-text">Todo para el hogar.</p>
                        <asp:Button class="btn btn-secondary" Text="Ver categoria" runat="server" ID="btnTelevisores" OnClick="btnTelevisores_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card" style="height: 340px">
                    <img style="height: 180px" src="https://www.copypress.com/wp-content/uploads/2022/04/digital-media-def-and-ex.png" class="card-img-top" alt="Categoría 4">
                    <div class="card-body">
                        <h5 class="card-title">Media</h5>
                        <p class="card-text">Ofertas especiales en todos los productos.</p>
                        <asp:Button class="btn btn-secondary" Text="Ver categoria" runat="server" ID="btnMedia" OnClick="btnMedia_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sección de Testimonios -->
    <div class="container mt-5">
        <h2 class="text-center mb-4">Testimonios de Clientes</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <blockquote class="blockquote">
                            <p class="mb-0">"Excelente atención y productos de calidad. ¡Muy recomendados!"</p>
                            <footer class="blockquote-footer">Juan Pérez</footer>
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <blockquote class="blockquote">
                            <p class="mb-0">"Compra fácil y rápida. Los electrodomésticos llegaron a tiempo y en perfectas condiciones."</p>
                            <footer class="blockquote-footer">Sebastian Balbuena</footer>
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <blockquote class="blockquote">
                            <p class="mb-0">"Gran variedad de productos y ofertas. Definitivamente volveré a comprar aquí."</p>
                            <footer class="blockquote-footer">Luis Fernández</footer>
                        </blockquote>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
